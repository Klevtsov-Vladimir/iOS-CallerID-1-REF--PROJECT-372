import UIKit
import RealmSwift

final class CreateProfileController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var continueView: MainButton!
    
    @IBOutlet private weak var continueButtonBottomConstraint: NSLayoutConstraint!
    
    private var imagePicker = UIImagePickerController()
    private var selectedIndexCell = 0
    private var profile = Profile()
    
    private let firstNameIndexPath = IndexPath(row: 1, section: 0)
    private let lastNameIndexPath = IndexPath(row: 2, section: 0)
    private let emailNameIndexPath = IndexPath(row: 3, section: 0)
    
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
    
    private var realm = try! Realm(configuration: config)
    
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
}

//MARK: - Private methods
private extension CreateProfileController {
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
//            
//            let indexPath = IndexPath(row: selectedIndexCell, section: 0)
//            tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
//            
//            view.layoutIfNeeded()
//        }
//    }
    
//    @objc func keyboardWillHide(notification: NSNotification) {
//        let model = UIDevice.model
//        let isNew = model == .iPhone12 || model == .iPhone11 || model == .iPhone11Pro || model == .iPhone11ProMax || model == .iPhone12Pro || model == .iPhone12ProMax || model == .iPhoneX || model == .iPhoneXR || model == .iPhoneXS || model == .iPhoneXSMax || model == .undefined
//        let keyboardTypeInfo = isNew == true ? UIResponder.keyboardFrameEndUserInfoKey : UIResponder.keyboardFrameBeginUserInfoKey
//        if let _ = (notification.userInfo?[keyboardTypeInfo] as? NSValue)?.cgRectValue {
//            self.continueButtonBottomConstraint.constant = 10
//            view.layoutIfNeeded()
//        }
//    }
    
    func showPictureAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let gallaryAction = UIAlertAction(title: "makePhoto".localized(), style: .default) { _ in
            self.imagePicker.allowsEditing = true
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .camera
            
            self.present(self.imagePicker, animated: true)
        }
        let photoAction = UIAlertAction(title: "chooseGallery".localized(), style: .default) { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.imagePicker.delegate = self
            
            self.present(self.imagePicker, animated: true)
        }
        
        let cancel = UIAlertAction(title: "cancel".localized(), style: .cancel) { _ in
            self.dismiss(animated: true)
        }
        
        
        alert.addAction(gallaryAction)
        alert.addAction(photoAction)
        alert.addAction(cancel)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        present(alert, animated: true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension CreateProfileController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        
        profile.avatarImage = image
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate
extension CreateProfileController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = Rows.allCases[indexPath.row]
        switch row {
//        case .picture: return 100
        default: return 95
        }
    }
}

//MARK: - UITableViewDataSource
extension CreateProfileController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Rows.allCases[indexPath.row]
        
        switch row {
//        case .picture:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as? PictureCell else { return UITableViewCell() }
//            
//            cell.pictureView.setImdaasdgfesdsdffdewews(profile.avatarImage)
//            cell.pictureView.saeastsTidtsldesTedsdsxdtssds(row.title)
//            
//            cell.pictureView.callback = {
//                self.selectedIndexCell = indexPath.row
//                self.showPictureAlert()
//            }
//            
//            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneVerifyCell", for: indexPath) as? PhoneVerifyCell else { return UITableViewCell() }
            
            cell.phoneView.isHiddenImage(isHidden: true)
            cell.phoneView.isHiddenLabel(isHidden: true)
            cell.phoneView.isHiddenTextField(isHidden: false)
            cell.phoneView.setTitleText(row.title)
            switch row {
            case .email: 
                cell.phoneView.setTextFieldKeyboardType(type: .emailAddress)
                cell.phoneView.textField.text = self.profile.email
            case .firstName:
                cell.phoneView.setTextFieldKeyboardType(type: .default)
                cell.phoneView.textField.text = self.profile.firstName
            case .lastName:
                cell.phoneView.setTextFieldKeyboardType(type: .default)
                cell.phoneView.textField.text = self.profile.lastName
//            case .picture:
//                break
            }
            
            cell.phoneView.callbackCountry = {
                self.selectedIndexCell = indexPath.row
            }
            
            cell.textFieldDidChange = { text in
                switch row {
                case .firstName:
                    self.profile.firstName = text
                case .lastName:
                    self.profile.lastName = text
                case .email:
                    self.profile.email = text
                default: break
                }
            }
            
            return cell
        }
    }
}

//MARK: - Setup
private extension CreateProfileController {
    func setup() {
        sexcvvsdvstupUI()
        setupTable()
        setupObservers()
        hideKeyboardWhenTappedAround()
    }
    
    func sexcvvsdvstupUI() {
        titleLabel.text = "createProfile".localized()
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        subtitleLabel.text = "createProfileSubtitle".localized()
        subtitleLabel.textColor = .black
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        continueView.setTitleText("continue".localized())
        continueView.callback = { [weak self] in
            guard let self = self else { return }
            let firstNameCell = self.tableView.cellForRow(at: self.firstNameIndexPath) as? PhoneVerifyCell
            let lastNameCell = self.tableView.cellForRow(at: self.lastNameIndexPath) as? PhoneVerifyCell
            let emailNameCell = self.tableView.cellForRow(at: self.emailNameIndexPath) as? PhoneVerifyCell
            
            guard let f = self.profile.firstName, let l = self.profile.lastName else { return }
            
            let isHaveFirstNameInfo = (f.isEmpty) || !(f.isValidName) || f.allSatisfy { $0 == " " } || !containsOnlyLettersAndNumbers(f)
            
            let isHaveLastNameInfo = (l.isEmpty) || l.allSatisfy { $0 == " " } || !containsOnlyLettersAndNumbers(l)
            var isHaveEmailInfo = true
            
            if isHaveFirstNameInfo {
                firstNameCell?.phoneView.animateBorder()
            }
            if isHaveLastNameInfo {
                lastNameCell?.phoneView.animateBorder()
            }

            if (self.profile.email != nil && self.profile.email?.count != 0) && !self.isValidEmail(self.profile.email ?? "") {
                emailNameCell?.phoneView.animateBorder()
                isHaveEmailInfo = false
            }
            
            if !isHaveLastNameInfo && !isHaveFirstNameInfo && isHaveEmailInfo {
                DatabaseManager.shared.setProfileInfo(
                    avatarImage: self.profile.avatarImage,
                    firstName: self.profile.firstName,
                    lastName: self.profile.lastName,
                    email: self.profile.email
                )
                
                DispatchQueue.main.async {
                    try! self.realm.write {
                        let model = CorasedasadRddealm.shared.profileDB.first
                        model?.avatarImage = self.profile.avatarImage.pngData() ?? Data()
                        model?.firstName = self.profile.firstName ?? ""
                        model?.lastName = self.profile.lastName ?? ""
                        model?.email = self.profile.email ?? ""
                    }
                }
                
                UserDefaults.standard.setValue(true, forKey: "isSetProfileInfo")
                
                DispatchQueue.main.async {
                    let controller = NotificationRequestController()
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }
        }
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PhoneVerifyCell", bundle: nil), forCellReuseIdentifier: "PhoneVerifyCell")
        tableView.register(UINib(nibName: "PictureCell", bundle: nil), forCellReuseIdentifier: "PictureCell")
    }
    
    func setupObservers() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: - Enums, Struct
private extension CreateProfileController {
    struct Profile {
        var avatarImage = #imageLiteral(resourceName: "defaultPictureAvatar")
        var firstName: String?
        var lastName: String?
        var email: String?
    }
    
    enum Rows: Int, CaseIterable {
        case /*picture, */firstName, lastName, email
        
        var title: String {
            switch self {
            //case .picture: return "addPicture".localized()
            case .firstName: return "firstName".localized()
            case .lastName: return "lastName".localized()
            case .email: return "email".localized()
            }
        }
    }
}
