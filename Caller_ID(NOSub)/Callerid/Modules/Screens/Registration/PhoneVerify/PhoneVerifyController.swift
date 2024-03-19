import UIKit
import PhoneNumberKit
import AppTrackingTransparency
import AdSupport

final class PhoneVerifyController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var continueView: MainButton!
    
    @IBOutlet private weak var continueButtonBottomConstraint: NSLayoutConstraint!
    
    private var phone = Phone()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addGradient(colors: [UIColor(named: "bg1stColor") ?? .clear, UIColor(named: "bg2ndColor") ?? .clear],
                         startPoint: CGPoint(x: 0.5, y: 0),
                         endPoint: CGPoint(x: 0.5, y: 1))
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            if #available(iOS 14, *) {
                ATTrackingManager.requestTrackingAuthorization { _ in
                }
            }
        }
}

//MARK: - Private methods
//private extension PhoneVerifyController {
//    @objc func keyboardWillShow(notification: NSNotification) {
//        let model = UIDevice.model
//        let isNew = model == .iPhone12 || model == .iPhone11 || model == .iPhone11Pro || model == .iPhone11ProMax || model == .iPhone12Pro || model == .iPhone12ProMax || model == .iPhoneX || model == .iPhoneXR || model == .iPhoneXS || model == .iPhoneXSMax || model == .undefined
//        let keyboardTypeInfo = isNew == true ? UIResponder.keyboardFrameEndUserInfoKey : UIResponder.keyboardFrameBeginUserInfoKey
//        if let keyboardSize = (notification.userInfo?[keyboardTypeInfo] as? NSValue)?.cgRectValue, self.continueButtonBottomConstraint.constant == 10 {
//            if UIDevice.current.userInterfaceIdiom == .pad {
//                self.continueButtonBottomConstraint.constant += keyboardSize.height + 60
//            } else {
//                self.continueButtonBottomConstraint.constant += keyboardSize.height + 35
//            }
//            view.layoutIfNeeded()
//        }
//    }
//    
//    @objc func keyboardWillHide(notification: NSNotification) {
//        let model = UIDevice.model
//        let isNew = model == .iPhone12 || model == .iPhone11 || model == .iPhone11Pro || model == .iPhone11ProMax || model == .iPhone12Pro || model == .iPhone12ProMax || model == .iPhoneX || model == .iPhoneXR || model == .iPhoneXS || model == .iPhoneXSMax || model == .undefined
//        let keyboardTypeInfo = isNew == true ? UIResponder.keyboardFrameEndUserInfoKey : UIResponder.keyboardFrameBeginUserInfoKey
//        if let _ = (notification.userInfo?[keyboardTypeInfo] as? NSValue)?.cgRectValue {
//            self.continueButtonBottomConstraint.constant = 10
//            view.layoutIfNeeded()
//        }
//    }
//}

//MARK: - UITableViewDelegate
extension PhoneVerifyController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: - UITableViewDataSource
extension PhoneVerifyController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneVerifyCell", for: indexPath) as? PhoneVerifyCell else { return UITableViewCell() }
        let row = Rows.allCases[indexPath.row]
        
        switch row {
        case .country:
            //cell.phoneView.setTitleText("country".localized())
            
            if !countries.isEmpty {
                cell.phoneView.isHiddenImage(isHidden: false)
                cell.phoneView.isHiddenLabel(isHidden: false)
                cell.phoneView.isHiddenTextField(isHidden: true)
                cell.phoneView.setCountryImage(phone.countryInfo?.imageCountry)
                
                let countryStr = phone.countryInfo?.countries?.name ?? ""
                let phoneCode = " (\(phone.countryInfo?.countries?.dialCode ?? ""))"
                cell.phoneView.setPhoneTitleText(countryStr + phoneCode)
            }
        case .phone:
            cell.phoneView.isHiddenImage(isHidden: true)
            cell.phoneView.isHiddenLabel(isHidden: true)
            cell.phoneView.isHiddenTextField(isHidden: false)
            //cell.phoneView.setTitleText("phoneNum".localized())
            cell.phoneView.setPlaceholder("phoneNumPlaceholder".localized())
            cell.phoneView.textField.keyboardType = .numberPad
            cell.phoneView.textField.autocorrectionType = .no
            cell.phoneView.textField.spellCheckingType = .no
            cell.phoneView.textField.text = self.phone.countryInfo?.countries?.dialCode
            
        }
        
        cell.callback = { [weak self] in
            let controller = CountriesListController()
            controller.callback = { country in
                self?.phone.countryInfo = country
                self?.tableView.reloadData()
            }
            
            self?.present(controller, animated: true)
        }
        
        cell.textFieldDidChange = { phone in
            self.phone.phone = phone
        }
        
        return cell
    }
}

//MARK: - Setup
private extension PhoneVerifyController {
    func setup() {
        setupUbllkbkbI()
        setupTable()
        setupObservers()
        hideKeyboardWhenTappedAround()
    }
    
    func containsNonDigits(_ input: String) -> Bool {
        let nonDigitCharacterSet = CharacterSet.decimalDigits.inverted
        return input.rangeOfCharacter(from: nonDigitCharacterSet) != nil
    }
    
    func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
    func setupUbllkbkbI() {
        let country = countries.filter { country in
            return country.countries?.code == "US"
        }
        
        phone = Phone(phone: "", countryInfo: country.first)
        
        titleLabel.text = "verifyTitle".localized()
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Manrope-Bold", size: 20)
        
        subtitleLabel.text = "verifySubtitle".localized()
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont(name: "Manrope-Medium", size: 16)
        
        continueView.setTitleText("continue".localized())
        continueView.callback = { [weak self] in
            guard let self = self else { return }
            let phoneNumberKit = PhoneNumberKit()
            
            
            let phoneNumberCustomDefaultRegion = try? phoneNumberKit.parse(self.phone.phone ?? "", withRegion: self.phone.countryInfo?.countries?.code ?? "", ignoreType: true)
            print(phoneNumberCustomDefaultRegion?.numberString)
            
            if phoneNumberCustomDefaultRegion == nil {
                let indexPath = IndexPath(row: 1, section: 0)
                let cell = self.tableView.cellForRow(at: indexPath) as? PhoneVerifyCell
                
                cell?.phoneView.animateBorder()
            } else {
                let dial = self.phone.countryInfo?.countries?.dialCode ?? ""
                let dialWithouPlus = (self.phone.countryInfo?.countries?.dialCode ?? "").replacingOccurrences(of: "+", with: "")
                var phone = self.phone.phone ?? ""
                let phoneWithoutPlus = (dial + phone).replacingOccurrences(of: "+", with: "").replacingOccurrences(of: " ", with: "")
                
                if phone.contains(dial) {
                    phone = self.phone.phone ?? ""
                } else if phone.contains(dialWithouPlus) {
                    phone = "+" + (self.phone.phone ?? "")
                } else {
                    phone = dial + phone
                }
                
                let actualPhone = "+" + String(phoneNumberCustomDefaultRegion?.countryCode ?? 0) + String(phoneNumberCustomDefaultRegion?.nationalNumber ?? 0)
                
                self.phone.phone = actualPhone
                
                let alert = UIAlertController(title: "verifyTitleAlert".localized(), message: actualPhone, preferredStyle: .actionSheet)
                
                let confirmAction = UIAlertAction(title: "confirm".localized(), style: .default) { _ in
                    let controller = SmsVerifyController(phone: self.phone)
                    TwilioManager.shared.sendSMS(phone: actualPhone.replacingOccurrences(of: "+", with: "")) { result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(_):
                                
                                DispatchQueue.main.async {
                                    let model = ProfileDB()
                                    model.country = self.phone.countryInfo?.countries?.code ?? ""

                                    CorasedasadRddealm.shared.addUser(model: model)
                                }
                                controller.codeSended()
                                
                            case .failure(let error):
                                controller.showFailedAlert(error: error.localizedDescription)
                            }
                        }
                    }
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                let cancelAction = UIAlertAction(title: "cancel".localized(), style: .default)
                
                alert.addAction(confirmAction)
                alert.addAction(cancelAction)
                
                if let popoverController = alert.popoverPresentationController {
                    popoverController.sourceView = self.view
                    popoverController.sourceRect = CGRect(x: self.view.bounds.midX ?? 0, y: self.view.bounds.midY ?? 0, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                }
                
                self.present(alert, animated: true)
            }
        }
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PhoneVerifyCell", bundle: nil), forCellReuseIdentifier: "PhoneVerifyCell")
        tableView.backgroundColor = .clear
    }
    
    func setupObservers() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: - Enums, Structs
struct Phone {
    var phone: String?
    var countryInfo: Countrydsfsdfsdddd?
}

enum Rows: Int, CaseIterable {
    case country, phone
    
    var title: String {
        switch self {
        case .country: return "country".localized()
        case .phone: return "phoneNum".localized()
        }
    }
    
    var placeholder: String {
        switch self {
        case .country: return Locale.current.languageCode ?? ""
        case .phone: return "phoneNumPlaceholder".localized()
        }
    }
}
