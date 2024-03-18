import UIKit
import Contacts
import ContactsUI
import MessageUI
import CallKit
import PhoneNumberKit
import SafariServices
import FloatingPanel
import RealmSwift

final class PhoneInfoController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var blockView: UIView!
    
    @IBOutlet weak var blockLabel: UILabel!
    
    
    private var floatingPanel: FloatingPanelController?
    private lazy var betterNameController = BetterNameController()
    
    private var contact = Contact()
    private lazy var phoneNumberKit = PhoneNumberKit()
    
    private var yFloationgStart: CGFloat = 0
    
    private let realm = CorasedasadRddealm.shared
    static let config = Realm.Configuration(
        schemaVersion: 5,
        migrationBlock: { migration, oldSchemaVersion in
            switch oldSchemaVersion {
            case 1:
                break
            default:
                break
            }
        })
    private var realmN = try! Realm(configuration: config)
    
    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        if !isPhoneInRealm() {
            if realm.profileDB.count == 0 {
                setPhoneToRealm(isEmpty: true)
            } else {
                setPhoneToRealm(isEmpty: false)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        tableView.reloadData()
    }
}

//MARK: - Private methods
private extension PhoneInfoController {
    @objc func keyboardWillShow(notification: NSNotification) {
        let model = UIDevice.model
        let isNew = model == .iPhone12 || model == .iPhone11 || model == .iPhone11Pro || model == .iPhone11ProMax || model == .iPhone12Pro || model == .iPhone12ProMax || model == .iPhoneX || model == .iPhoneXR || model == .iPhoneXS || model == .iPhoneXSMax || model == .undefined
        let keyboardTypeInfo = isNew == true ? UIResponder.keyboardFrameEndUserInfoKey : UIResponder.keyboardFrameBeginUserInfoKey
        if let keyboardSize = (notification.userInfo?[keyboardTypeInfo] as? NSValue)?.cgRectValue, floatingPanel?.surfaceView.frame.origin.y == yFloationgStart {
            self.floatingPanel?.surfaceView.frame.origin.y -= keyboardSize.height
            view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let model = UIDevice.model
        let isNew = model == .iPhone12 || model == .iPhone11 || model == .iPhone11Pro || model == .iPhone11ProMax || model == .iPhone12Pro || model == .iPhone12ProMax || model == .iPhoneX || model == .iPhoneXR || model == .iPhoneXS || model == .iPhoneXSMax || model == .undefined
        let keyboardTypeInfo = isNew == true ? UIResponder.keyboardFrameEndUserInfoKey : UIResponder.keyboardFrameBeginUserInfoKey
        if let _ = (notification.userInfo?[keyboardTypeInfo] as? NSValue)?.cgRectValue {
            floatingPanel?.surfaceView.frame.origin.y = yFloationgStart
            view.layoutIfNeeded()
        }
    }
    
    func call(number: String) {
        var phoneNumberCustomDefaultRegion = try? phoneNumberKit.parse(number)
        if phoneNumberCustomDefaultRegion == nil {
                    phoneNumberCustomDefaultRegion = try? phoneNumberKit.parse("+" + number)
                }
        let actualPhone = "+" + String(phoneNumberCustomDefaultRegion?.countryCode ?? 0) + String(phoneNumberCustomDefaultRegion?.nationalNumber ?? 0)
        
        if let url = URL(string: "tel://\(actualPhone)"), phoneNumberCustomDefaultRegion != nil {
            UIApplication.shared.open(url)
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid phone number", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .destructive) { action in
                
            }
            
            alert.addAction(ok)
            
            if let popoverController = alert.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
            
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
        }
    }
    
    func isPhoneInRealm() -> Bool {
        let historyOld = realm.profileDB.first?.historyPhoneSearch.filter({ history in
            if self.contact.contact != nil {
                let contactPhone = (self.contact.contact?.phoneNumbers.first?.value.stringValue ?? "").replacingOccurrences(of: "+", with: "")
                                    .replacingOccurrences(of: " ", with: "")
                                    .replacingOccurrences(of: "(", with: "")
                                    .replacingOccurrences(of: ")", with: "")
                
                return history.phoneNumber.contains(contactPhone) || history.phoneNumber == contactPhone
            } else {
                let phone = self.contact.phone?.replacingOccurrences(of: "+", with: "")
                                    .replacingOccurrences(of: " ", with: "")
                                    .replacingOccurrences(of: "(", with: "")
                                    .replacingOccurrences(of: ")", with: "")
                                return history.phoneNumber.contains(phone ?? "") || history.phoneNumber == phone
            }
        })
        
        return (historyOld?.count == 0 || historyOld == nil) ? false : true
    }
    
    func setPhoneToRealm(isEmpty: Bool) {
        guard let model = realm.profileDB.first else { return }
        let historyOld = realm.profileDB.first?.historyPhoneSearch
        let historyNew = HistoryPhoneSearch()
        
        let contactNum = (contact.contact?.phoneNumbers.first?.value.stringValue ?? "").replacingOccurrences(of: "+", with: "")
                    .replacingOccurrences(of: " ", with: "")
                    .replacingOccurrences(of: "(", with: "")
                    .replacingOccurrences(of: ")", with: "")
        var phone = ""
        if contact.contact != nil {
            phone = contactNum
            let phoneInfo = try? phoneNumberKit.parse(phone)
            let address = countries.filter({ country in
                country.countries?.code == phoneInfo?.regionID ?? ""
            }).first
            
            if contact.contact == nil {
                historyNew.country = contact.address ?? ""
            } else {
                if phoneInfo == nil {
                    historyNew.country = contact.address ?? ""
                } else {
                    historyNew.country = address?.countries?.name ?? ""
                }
            }
            historyNew.phoneNumberWithDial = (contact.contact?.phoneNumbers.first?.value.stringValue ?? "")
            historyNew.name = (contact.contact?.givenName ?? "") + " " + (contact.contact?.familyName ?? "")
            
            historyNew.firstName = contact.contact?.givenName ?? ""
            historyNew.lastName = contact.contact?.familyName ?? ""
        } else {
            let nPhone = (contact.phone ?? "").replacingOccurrences(of: "+", with: "")
                            .replacingOccurrences(of: " ", with: "")
                            .replacingOccurrences(of: "(", with: "")
                            .replacingOccurrences(of: ")", with: "")
            let phoneInfo = try? phoneNumberKit.parse(nPhone)
            let address = countries.filter({ country in
                country.countries?.code == phoneInfo?.regionID ?? ""
            }).first
            phone = nPhone
            if phoneInfo == nil {
                historyNew.country = contact.address ?? ""
            } else {
                historyNew.country = address?.countries?.name ?? ""
            }
            historyNew.name = phone
            historyNew.phoneNumberWithDial = contact.phone ?? ""
        }
        
        
        historyNew.dateChanged = Date()
        historyNew.phoneNumber = phone
        
        try! self.realmN.write {
            historyOld?.append(historyNew)
        }
        
        
//        if let historyOld = historyOld {
//            let t = List<HistoryPhoneSearch>()
//            t.append(historyNew)
//            for obj in historyOld {
//                t.append(obj)
//            }
//            //            historyOld?.append(historyNew)
//            realm.updateValue(list: ["historyPhoneSearch": t])
//        }
    }
    
    func sendMessage(number: String) {
        if MFMessageComposeViewController.canSendText() && !number.isEmpty {
            DispatchQueue.main.async {
                let controller = MFMessageComposeViewController()
                controller.recipients = [number]
                controller.messageComposeDelegate = self
                
                self.present(controller, animated: true, completion: nil)
            }
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Your device does not support SMS.", preferredStyle: .alert)
            let notNowAlertAction = UIAlertAction(title: "ok".localized(), style: .default) { action in
                
            }
            
            alert.addAction(notNowAlertAction)
            
            if let popoverController = alert.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
            
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }

        }
    }
    
    func isNumberBlocked(number: String) -> Bool {
        let userDefaults = UserDefaults(suiteName: appGroup)
        guard let array = (userDefaults?.value(forKey: "blockNumbers")) as? [String:Any] else { return false }
        for (_, num) in array.enumerated() {
            let phKey = num.key
                .replacingOccurrences(of: "+", with: "")
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "(", with: "")
                .replacingOccurrences(of: ")", with: "")
            if phKey == number {
                return true
            }
        }
        return false
    }
    
    func blockNumber(type: BlockAction) {
        let contactPhoneReplace = (self.contact.contact?.phoneNumbers.first?.value.stringValue ?? "").replacingOccurrences(of: "+", with: "")
                    .replacingOccurrences(of: " ", with: "")
                    .replacingOccurrences(of: "(", with: "")
                    .replacingOccurrences(of: ")", with: "")
                let phoneReplace = self.contact.phone?.replacingOccurrences(of: "+", with: "")
                    .replacingOccurrences(of: " ", with: "")
                    .replacingOccurrences(of: "(", with: "")
                    .replacingOccurrences(of: ")", with: "")
        
        let userDefaults = UserDefaults(suiteName: appGroup)
        let historyOld = realm.profileDB.first?.historyPhoneSearch
        var realmPhone = HistoryPhoneSearch()
        if contact.contact == nil {
            realmPhone = self.realm.profileDB.first?.historyPhoneSearch.filter({ phone in
                phone.phoneNumber == phoneReplace
            }).first ?? HistoryPhoneSearch()
        } else {
            realmPhone = self.realm.profileDB.first?.historyPhoneSearch.filter({ phone in
                phone.phoneNumber == contactPhoneReplace
            }).first ?? HistoryPhoneSearch()
        }
        guard var array = (userDefaults?.value(forKey: "blockNumbers")) as? [String:Any] else {
            return
        }
        switch type {
        case .remove(let number):
            for phone in array {
                let phKey = phone.key
                                    .replacingOccurrences(of: "+", with: "")
                                    .replacingOccurrences(of: " ", with: "")
                                    .replacingOccurrences(of: "(", with: "")
                                    .replacingOccurrences(of: ")", with: "")
                                if number == phKey {
                    array.removeValue(forKey: phone.key)
                }
            }
            try! realmN.write {
                realmPhone.isBlocked = false
            }
        default: break
        }
        
        var sorted = array.sorted { first, second in
            let a = Int(first.key) ?? 0
            let b = Int(second.key) ?? 0
            return a < b
        }
        
        let newArr = Dictionary(uniqueKeysWithValues: sorted)
        
        userDefaults?.set(newArr, forKey: "blockNumbers")
        callExt()
        
        func callExt() {
            CallDirectoryManagerUtils.reloadExtension {
                
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func shareContacts(contact: CNContact) throws {
        guard let directoryURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return
        }

        var filename = UUID().uuidString
        
        if let fullname = CNContactFormatter().string(from: contact) {
            filename = fullname.components(separatedBy: " ").joined(separator: " ")
        }
        
        let fileURL = directoryURL
            .appendingPathComponent("\(filename).vcf")

        var data = Data()
        do {
            data = try CNContactVCardSerialization.data(with: [contact])
        } catch let error {
            print(error)
        }

        try data.write(to: fileURL, options: .atomicWrite)

        let activityViewController = UIActivityViewController(
            activityItems: [fileURL],
            applicationActivities: nil
        )
        
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }

        present(activityViewController, animated: true)
    }
    
    func createContact() -> CNContact {
        let contact = CNMutableContact()
        contact.givenName = self.contact.phone ?? "error"
        contact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue: "\(self.contact.phone ?? "")"))]

        return contact
    }
    
    func openSafari(text: String) {
        if let url = URL(string: "https://google.com/search?q=\(text)") {
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.delegate = self
            self.present(safariViewController, animated: true, completion: nil)
        }
    }
    
    func addPhoneNumber(number: String) {
        if #available(iOS 9.0, *) {
            let store = CNContactStore()
            let contact = CNMutableContact()
            let homePhone = CNLabeledValue(label: CNLabelHome, value: CNPhoneNumber(stringValue :number))
            contact.phoneNumbers = [homePhone]
            let controller = CNContactViewController(forUnknownContact : contact)
            controller.contactStore = store
            controller.delegate = self
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

//MARK: - Actions
private extension PhoneInfoController {
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDelegate
extension PhoneInfoController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = Rows.allCases[indexPath.row]
        switch row {
        case .top: return 253
        case .banner: return 0
        case .address: return 90
        case .functions: return 240
        }
    }
}

//MARK: - UITableViewDataSource
extension PhoneInfoController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Rows.allCases[indexPath.row]
        let contactPhoneReplace = (self.contact.contact?.phoneNumbers.first?.value.stringValue ?? "").replacingOccurrences(of: "+", with: "")
                    .replacingOccurrences(of: " ", with: "")
                    .replacingOccurrences(of: "(", with: "")
                    .replacingOccurrences(of: ")", with: "")
                let phoneReplace = self.contact.phone?.replacingOccurrences(of: "+", with: "")
                    .replacingOccurrences(of: " ", with: "")
                    .replacingOccurrences(of: "(", with: "")
                    .replacingOccurrences(of: ")", with: "")
        
        var realmPhone = HistoryPhoneSearch()
        if contact.contact == nil {
            realmPhone = self.realm.profileDB.first?.historyPhoneSearch.filter({ phone in
                phone.phoneNumber == phoneReplace
            }).first ?? HistoryPhoneSearch()
        } else {
            realmPhone = self.realm.profileDB.first?.historyPhoneSearch.filter({ phone in
                phone.phoneNumber == contactPhoneReplace
            }).first ?? HistoryPhoneSearch()
        }
        
        switch row {
        case .top:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneInfoTopCell", for: indexPath) as? PhoneInfoTopCell else { return UITableViewCell() }
            var phone = realmPhone.phoneNumberWithDial
                .replacingOccurrences(of: "+", with: "")
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "(", with: "")
                .replacingOccurrences(of: ")", with: "")
            cell.phoneLabel.text = realmPhone.name
//            if contact.contact == nil {
//                if isPhoneInRealm() {
//
//                } else {
////                    phone = contact.phone ?? ""
//                    cell.phoneLabel.text = phone
//                }
//            } else {
//                if isPhoneInRealm() {
//                    cell.phoneLabel.text = realmPhone.name
//                } else {
////                    phone = contact.contact?.phoneNumbers.first?.value.stringValue ?? ""
//                    cell.phoneLabel.text = "\(contact.contact?.givenName ?? "") \(contact.contact?.familyName ?? "")"
//                }
//            }
            
            UIView.animate(withDuration: 0.3) {
                if !self.isNumberBlocked(number: phone) {
                    cell.callFuncView.imageView.image = #imageLiteral(resourceName: "phone3")
                    cell.messageFuncView.imageView.image = #imageLiteral(resourceName: "message")
                    cell.blockFuncView.imageView.image = #imageLiteral(resourceName: "block")
                    cell.avatarImageView.image = #imageLiteral(resourceName: "defaultUserAvatar")
                    cell.containerAvatarImageView.backgroundColor = .init(red: 231/255, green: 231/255, blue: 1, alpha: 1)
                    cell.blockFuncView.titleLabel.text = "block".localized()
                } else {
                    cell.blockFuncView.imageView.image = #imageLiteral(resourceName: "callIconBlocked")
                    cell.messageFuncView.imageView.image = #imageLiteral(resourceName: "messageBlocked")
                    cell.callFuncView.imageView.image = #imageLiteral(resourceName: "phoneBlocked")
                    cell.avatarImageView.image = #imageLiteral(resourceName: "callIconBlocked")
                    cell.containerAvatarImageView.backgroundColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 0.2)
                    cell.blockFuncView.titleLabel.text = "unblock".localized()
                }
            }
            
            cell.callback = { [weak self] type in
                switch type {
                case .call: self?.call(number: phone)
                case .message: self?.sendMessage(number: phone)
                case .block:
                    if (self?.isNumberBlocked(number: phone) ?? false) {
                        self?.blockNumber(type: .remove(number: phone))
                        
                        cell.blockFuncView.titleLabel.text = "block".localized()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            self?.blockView.isHidden = false
                            self?.blockLabel.text = "blockBanR".localized()
                            UIView.animate(withDuration: 0.8) {
                                self?.blockView.alpha = 1
                            } completion: { _ in
                                UIView.animate(withDuration: 1.5) {
                                    self?.blockView.alpha = 0
                                }
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            let controller = BlockReportController()
                            controller.view.backgroundColor = .clear
                            controller.contact = self?.contact ?? Contact()
                            
                            controller.callback = {
                                self?.blockView.isHidden = false
                                self?.blockLabel.text = "blockBan".localized()
                                cell.blockFuncView.titleLabel.text = "unblock".localized()
                                UIView.animate(withDuration: 0.8) {
                                    self?.blockView.alpha = 1
                                } completion: { _ in
                                    UIView.animate(withDuration: 1.5) {
                                        self?.blockView.alpha = 0
                                    }
                                }

                                tableView.reloadData()
                            }
                            
//                            if let popoverController = controller.popoverPresentationController {
//                                popoverController.sourceView = self?.view
//                                popoverController.sourceRect = CGRect(x: self?.view.bounds.midX ?? 0.0, y: self?.view.bounds.midY ?? 0.0, width: 0, height: 0)
//                                popoverController.permittedArrowDirections = []
//                            }
                            
//                            controller.modalTransitionStyle = .crossDissolve
                            self?.present(controller, animated: true)
                        }
                    }
//                        self?.blockNumber(type: .add(number: phone))
//                    }
                }
            }
            
            return cell
        case .banner:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneBannerCell", for: indexPath) as? PhoneBannerCell else { return UITableViewCell() }
            
            cell.rootController = self
            
            return cell
        case .address:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneAddressCell", for: indexPath) as? PhoneAddressCell else { return UITableViewCell() }
            
            cell.titleLabel.text = "address".localized()
            cell.subtitleLabel.text = realmPhone.country
            
            return cell
        case .functions:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FunctionsPhoneCell", for: indexPath) as? FunctionsPhoneCell else { return UITableViewCell() }
            
            cell.callback = { [weak self] type in
                switch type {
                case .share:
                    if self?.contact.contact == nil {
                        try? self?.shareContacts(contact: self?.createContact() ?? CNContact())
                    } else {
                        try? self?.shareContacts(contact: self?.contact.contact ?? CNContact())
                    }
                case .web:
                    let alert = UIAlertController(title: "searchAlert".localized(), message: "", preferredStyle: .actionSheet)
                    
                    let nameAction = UIAlertAction(title: "name".localized(), style: .default) { _ in
                        if self?.contact.contact != nil {
                            let encodedText = self?.contact.contact?.givenName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                            self?.openSafari(text: encodedText ?? "")
                        } else {
                            
                            let encodedText = realmPhone.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)//(self?.contact.phone ?? "").replacingOccurrences(of: "+", with: "").replacingOccurrences(of: " ", with: "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                            self?.openSafari(text: encodedText ?? "")
                        }
                    }
                    let numberAction = UIAlertAction(title: "phoneNum".localized(), style: .default) { _ in
                        if self?.contact.contact != nil {
                            let encodedText = contactPhoneReplace.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                            self?.openSafari(text: encodedText ?? "")
                        } else {
                            let encodedText = (self?.contact.phone ?? "").replacingOccurrences(of: "+", with: "").replacingOccurrences(of: " ", with: "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                            self?.openSafari(text: encodedText ?? "")
                        }
                    }
                    let cancelAction = UIAlertAction(title: "cancel".localized(), style: .cancel)
                    
                    alert.addAction(nameAction)
                    alert.addAction(numberAction)
                    alert.addAction(cancelAction)
                    
                    if let popoverController = alert.popoverPresentationController {
                        popoverController.sourceView = self?.view
                        popoverController.sourceRect = CGRect(x: self?.view.bounds.midX ?? 0, y: self?.view.bounds.midY ?? 0, width: 0, height: 0)
                        popoverController.permittedArrowDirections = []
                    }
                    
                    self?.present(alert, animated: true)
                case .save:
                    if self?.contact.contact == nil {
                        self?.addPhoneNumber(number: self?.contact.phone ?? "")
                    }
                case .name:
                    if self?.contact.contact != nil {
                        self?.setupFloatingPanel(phoneN: contactPhoneReplace)
                    } else {
                        self?.setupFloatingPanel(phoneN: phoneReplace ?? "")
                    }
                }
            }
            
            return cell
        }
    }
}

//MARK: - SFSafariViewControllerDelegate, CNContactViewControllerDelegate
extension PhoneInfoController: SFSafariViewControllerDelegate, CNContactViewControllerDelegate {

}

//MARK: - MFMessageComposeViewControllerDelegate
extension PhoneInfoController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
        case .failed:
            print("Message failed")
        case .sent:
            print("Message was sent")
        default:
            return
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

//MARK: - FloatingPanelControllerDelegate
extension PhoneInfoController: FloatingPanelControllerDelegate {
    
}

//MARK: - Setup
private extension PhoneInfoController {
    func setup() {
        setuvcxswwweepUI()
        setupTable()
        setupObservers()
        
        blockView.layer.cornerRadius = 8
        blockView.backgroundColor = .init(red: 55/255, green: 60/255, blue: 71/255, alpha: 0.94)
        blockView.isHidden = true
        blockView.alpha = 0
        
        blockLabel.text = "blockBan".localized()
    }
    
    func setuvcxswwweepUI() {
        titleLabel.text = "callDetailTitle".localized().uppercased()
        titleLabel.textColor = .black
        titleLabel.font = .init(name: "Archivo_Condensed-SemiBold", size: 18)//.systemFont(ofSize: 18, weight: .medium)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PhoneInfoTopCell", bundle: nil), forCellReuseIdentifier: "PhoneInfoTopCell")
        tableView.register(UINib(nibName: "PhoneBannerCell", bundle: nil), forCellReuseIdentifier: "PhoneBannerCell")
        tableView.register(UINib(nibName: "PhoneAddressCell", bundle: nil), forCellReuseIdentifier: "PhoneAddressCell")
        tableView.register(UINib(nibName: "FunctionsPhoneCell", bundle: nil), forCellReuseIdentifier: "FunctionsPhoneCell")
    }
    
    func setupFloatingPanel(phoneN: String) {
        floatingPanel = FloatingPanelController()
        floatingPanel?.delegate = self
        floatingPanel?.layout = PhoneFloatingPanelLayout()
        
        betterNameController.closeCallback = { [weak self] in
            self?.floatingPanel?.removePanelFromParent(animated: true)
            self?.floatingPanel = nil
            self?.view.endEditing(true)
        }
        
        betterNameController.saveCallback = { [weak self] name in
            self?.floatingPanel?.removePanelFromParent(animated: true)
            self?.floatingPanel = nil
            self?.view.endEditing(true)
            let historyOld = self?.realm.profileDB.first?.historyPhoneSearch.filter({ phone in
                phone.phoneNumber == phoneN
            }).first  //self?.realm.profileDB.first?.historyPhoneSearch[index]
            
//            let newHistoryPhone = historyOld
            try! self?.realmN.write {
                historyOld?.name = name
            }
            
            
//            self?.realm.updateValue(list: ["historyPhoneSearch": historyOld])
            self?.tableView.reloadData()
        }
        
        let appearance = SurfaceAppearance()
        appearance.cornerRadius = 22
        floatingPanel?.surfaceView.appearance = appearance
        floatingPanel?.panGestureRecognizer.isEnabled = false
        
        floatingPanel?.surfaceView.grabberHandle.isHidden = true
        
        floatingPanel?.set(contentViewController: betterNameController)
        floatingPanel?.addPanel(toParent: self)
        
        yFloationgStart = floatingPanel?.surfaceView.frame.origin.y ?? 0
    }
    
    func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: - Enums, Structs
struct Contact {
    var contact: CNContact?
    var phone: String?
    var address: String?
    var phoneWithoutDial: String?
}

private extension PhoneInfoController {
    enum Rows: Int, CaseIterable {
        case top, banner, address, functions
    }
}

enum BlockAction {
    case add(number: [String:String]), remove(number: String)
}

//MARK: - PhoneFloatingPanelLayout
final class PhoneFloatingPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .half
    let anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [
        .full: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
        .half: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea),
        .tip: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea),
    ]
}
