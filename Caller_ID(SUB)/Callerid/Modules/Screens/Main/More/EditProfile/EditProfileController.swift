import UIKit
import RealmSwift

final class EditProfileController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var cantainerView: UIView!
    
    private var profileRealm = CorasedasadRddealm.shared.profileDB.first
    
    private var imagePicker = UIImagePickerController()
    
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
    
    private var info: EditInfo = {
        let info = EditInfo(
            firstName: CorasedasadRddealm.shared.profileDB.first?.firstName ?? "",
            lastName: CorasedasadRddealm.shared.profileDB.first?.lastName ?? "",
            email: CorasedasadRddealm.shared.profileDB.first?.email ?? "",
            phone: CorasedasadRddealm.shared.profileDB.first?.phone ?? "",
            gender: CorasedasadRddealm.shared.profileDB.first?.gender ?? "",
            website: CorasedasadRddealm.shared.profileDB.first?.website ?? "",
            job: CorasedasadRddealm.shared.profileDB.first?.job ?? "",
            company: CorasedasadRddealm.shared.profileDB.first?.company ?? "",
            street: CorasedasadRddealm.shared.profileDB.first?.street ?? "",
            zip: CorasedasadRddealm.shared.profileDB.first?.zip ?? "",
            city: CorasedasadRddealm.shared.profileDB.first?.city ?? "",
            country: CorasedasadRddealm.shared.profileDB.first?.country ?? ""
        )
        
        return info
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keysssboardsWilslsSshow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboarcslodWvillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        poiuhjkiuhnmjkuhnmkl()
    }
    
    @objc func keysssboardsWilslsSshow(notification: Notification) {
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            print("Notification: Keyboard will show")
            tableView.setBottomInset(to: keyboardHeight)
        }
    }

    @objc func keyboarcslodWvillHide(notification: Notification) {
        print("Notification: Keyboard will hide")
        tableView.setBottomInset(to: 0.0)
    }
    
    
}
func containsOnlyLettersAndNumbers(_ string: String) -> Bool {
    // Регулярное выражение для поиска спецсимволов и смайликов
    let regexPattern = "[^a-zA-Z0-9]"
    
    do {
        let regex = try NSRegularExpression(pattern: regexPattern)
        let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count))
        
        // Если найдено совпадение, то в строке есть спецсимвол или смайлик
        return matches.count == 0
    } catch {
        print("Ошибка при создании регулярного выражения: \(error)")
        return false
    }
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension EditProfileController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        
        DispatchQueue.main.async {
            try! self.realm.write {
                self.profileRealm?.avatarImage = image.pngData() ?? Data()
            }
        }
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? EditImageCell
        cell?.avatarImageView.image = image
    }
}

//MARK: - Actions
private extension EditProfileController {
    func verifyUrl(urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    @IBAction func closeAction(_ sender: Any) {
        var ret = false
        
        let cellFName = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? PhoneVerifyCell
        let cellLName = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? PhoneVerifyCell
        
        let cellMail = tableView.cellForRow(at: IndexPath(row: 5, section: 0)) as? PhoneVerifyCell
        let cellZip = tableView.cellForRow(at: IndexPath(row: 10, section: 0)) as? PhoneVerifyCell
        let cellWebsite = tableView.cellForRow(at: IndexPath(row: 6, section: 0)) as? PhoneVerifyCell
        
        if info.firstName.isEmpty || info.firstName.allSatisfy { $0 == " " } || !containsOnlyLettersAndNumbers(info.firstName) {
            cellFName?.phoneView.animateBorder()
            ret = true
        }
        
        if info.lastName.isEmpty || info.lastName.allSatisfy { $0 == " " } || !containsOnlyLettersAndNumbers(info.lastName) {
            cellLName?.phoneView.animateBorder()
            ret = true
        }
        
        if !isValidEmail(info.email) && !info.email.isEmpty {
            cellMail?.phoneView.animateBorder()
            ret = true
        }
        
        if !containsOnlyLettersAndNumbers(info.zip) && !info.zip.isEmpty {
            cellZip?.phoneView.animateBorder()
            ret = true
        }
        
        var website = info.website
        
        if !website.contains("http") && !info.website.isEmpty {
            website = "http://" + website
        }
        
        let inputString = info.website
        let characterToCount: Character = "."
        var count = 0

        for character in inputString {
            if character == characterToCount {
                count += 1
            }
        }
        
        if (!verifyUrl(urlString: website) || !info.website.contains("www") || !info.website.contains("com") || count < 2) && !info.website.isEmpty {
            cellWebsite?.phoneView.animateBorder()
            ret = true
        }
        
        if ret {
            return
        } else {
            try! self.realm.write {
                self.profileRealm?.website = website
            }
            dismiss(animated: true)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
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
}

extension String {
    func isValidUrl() -> Bool {
        let regex = "((http|https|ftp)://)?((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}

//MARK: - UITableViewDelegate
extension EditProfileController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = Rows.allCases[indexPath.row]
        
        switch row {
        case .image: return 136
        default: return 90
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = Rows.allCases[indexPath.row]
        
        switch row {
        case .gender:
            let alert = UIAlertController(title: "gender".localized(), message: nil, preferredStyle: .actionSheet)
            let maleAction = UIAlertAction(title: "male".localized(), style: .default) { _ in
                DispatchQueue.main.async {
                    try! self.realm.write {
                        self.profileRealm?.gender = "male".localized()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    let cell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? EditGenderCell
                    cell?.placeholderLabel.text = self.profileRealm?.gender
                }
            }
            let femaleAction = UIAlertAction(title: "female".localized(), style: .default) { _ in
                DispatchQueue.main.async {
                    try! self.realm.write {
                        self.profileRealm?.gender = "female".localized()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        let cell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? EditGenderCell
                        cell?.placeholderLabel.text = self.profileRealm?.gender
                    }
                    
                }
            }
            
            let preferAction = UIAlertAction(title: "genderP".localized(), style: .default) { _ in
                DispatchQueue.main.async {
                    try! self.realm.write {
                        self.profileRealm?.gender = "genderP".localized()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        let cell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? EditGenderCell
                        cell?.placeholderLabel.text = self.profileRealm?.gender
                    }
                    
                }
            }
            
            let cancel = UIAlertAction(title: "cancel".localized(), style: .cancel) { _ in
            }
            
            if let popoverController = alert.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
            
            
            alert.addAction(cancel)
            alert.addAction(maleAction)
            alert.addAction(femaleAction)
            alert.addAction(preferAction)
            
            present(alert, animated: true)
        case .image:
            self.showPictureAlert()
        case .country:
//            let controller = CountriesListController()
//            controller.callback = { countryM in
//                //                    DispatchQueue.main.async {
//                let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? PhoneVerifyCell
//                try! self.realm.write {
//                    self.profileRealm?.country = countryM.countries?.code ?? ""
//                }
//                let dataOfCountryN = countries.filter { country in
//                    country.countries?.code == countryM.countries?.code
//                }.first
//                cell?.phoneView.setTitleText(row.title ?? "")
//                cell?.phoneView.countryPhoneLabel.text = ("\(dataOfCountryN?.countries?.name ?? "") (\(dataOfCountryN?.countries?.dialCode ?? ""))")
//                cell?.phoneView.setCountryImage(dataOfCountryN?.imageCountry ?? UIImage())
//                cell?.phoneView.isHiddenTextField(isHidden: true)
//                //                        tableView.reloadData()
//                //                    }
//            }
//            self.present(controller, animated: true)
            break
            
        default: break
        }
    }
}

//MARK: - UITableViewDataSource
extension EditProfileController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Rows.allCases[indexPath.row]
        
        switch row {
        case .image:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditImageCell", for: indexPath) as? EditImageCell else { return UITableViewCell() }
            
            if !(CorasedasadRddealm.shared.profileDB.first?.avatarImage.isEmpty ?? false) {
                cell.avatarImageView.image = UIImage(data: CorasedasadRddealm.shared.profileDB.first?.avatarImage ?? Data())
                cell.containerImageView.backgroundColor = .clear
            } else {
                cell.avatarImageView.image = #imageLiteral(resourceName: "profileImageDefault")
                cell.containerImageView.backgroundColor = .init(red: 231/255, green: 231/255, blue: 1, alpha: 1)
            }
            
//            cell.viewTapped = { [weak self] in
//                self?.showPictureAlert()
//            }
            
            return cell
        case .gender:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditGenderCell", for: indexPath) as? EditGenderCell else { return UITableViewCell() }
            
            cell.titleLabel.text = row.title
            if (profileRealm?.gender.isEmpty ?? false) {
                cell.placeholderLabel.text = row.placeholder
            } else {
                cell.placeholderLabel.text = profileRealm?.gender
            }
            
            return cell
        case .country:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneVerifyCell", for: indexPath) as? PhoneVerifyCell else { return UITableViewCell() }
            
            let countryRealm = CorasedasadRddealm.shared.profileDB.first?.country
            let dataOfCountry = countries.filter { country in
                country.countries?.code == countryRealm
            }.first
            
            
            cell.phoneView.setTitleText(row.title ?? "")
//            cell.containerView?.removeGestureRecognizer(cell.)
            cell.phoneView.countryPhoneLabel.text = ("\(dataOfCountry?.countries?.name ?? "") (\(dataOfCountry?.countries?.dialCode ?? ""))")
            cell.phoneView.countryPhoneLabel.isHidden = false
            cell.phoneView.setCountryImage(dataOfCountry?.imageCountry ?? UIImage())
            cell.phoneView.isHiddenTextField(isHidden: true)
            
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneVerifyCell", for: indexPath) as? PhoneVerifyCell else { return UITableViewCell() }
            
            cell.phoneView.textFieldDidChange = { text in
                switch indexPath.row {
                case 1:
//                    DispatchQueue.main.async {
                    self.info.firstName = text
                        try! self.realm.write {
                            self.profileRealm?.firstName = text
                        }
//                        tableView.reloadData()
//                    }
                case 2:
//                    DispatchQueue.main.async {
                    self.info.lastName = text
                        try! self.realm.write {
                            self.profileRealm?.lastName = text
                        }
//                        tableView.reloadData()
//                    }
                case 4:
//                    DispatchQueue.main.async {
                        try! self.realm.write {
                            self.profileRealm?.phone = text
                        }
//                        tableView.reloadData()
//                    }
                case 5:
//                    DispatchQueue.main.async {
                    self.info.email = text
                        try! self.realm.write {
                            self.profileRealm?.email = text
                        }
//                        tableView.reloadData()
//                    }
                case 6:
//                    DispatchQueue.main.async {
                    self.info.website = text
                        try! self.realm.write {
                            self.profileRealm?.website = text
                        }
//                        tableView.reloadData()
//                    }
                case 7:
//                    DispatchQueue.main.async {
                        try! self.realm.write {
                            self.profileRealm?.job = text
                        }
//                        tableView.reloadData()
//                    }
                case 8:
//                    DispatchQueue.main.async {
                        try! self.realm.write {
                            self.profileRealm?.company = text
                        }
//                        tableView.reloadData()
//                    }
                case 9:
//                    DispatchQueue.main.async {
                        try! self.realm.write {
                            self.profileRealm?.street = text
                        }
//                        tableView.reloadData()
//                    }
                case 10:
//                    DispatchQueue.main.async {
                    self.info.zip = text
                        try! self.realm.write {
                            self.profileRealm?.zip = text
                        }
//                        tableView.reloadData()
//                    }
                case 11:
//                    DispatchQueue.main.async {
                        try! self.realm.write {
                            self.profileRealm?.city = text
                        }
//                        tableView.reloadData()
//                    }
                default: break
                }
            }
            
            cell.phoneView.setTitleText(row.title ?? "")
            cell.phoneView.textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            cell.phoneView.textField.textColor = .black
            cell.phoneView.maxLength = 50
            switch row {
            case .firstName:
                cell.phoneView.textField.isEnabled = true
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.isHiddenLabel(isHidden: true)
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.textField.keyboardType = .default
                
//                if profileRealm?.firstName.count == 0  {
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.firstName ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                
                return cell
            case .lastName:
                cell.phoneView.textField.isEnabled = true
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.isHiddenLabel(isHidden: true)
                cell.phoneView.textField.keyboardType = .default
                
//                if profileRealm?.lastName.count == 0  {
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.lastName ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                return cell
            case .phone:
                cell.phoneView.textField.isEnabled = false
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.textField.keyboardType = .numberPad
//                cell.phoneView.textField.keyboardType = .default
                cell.phoneView.isHiddenLabel(isHidden: true)
                
//                if profileRealm?.phone.count == 0  {
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.phone ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                return cell
            case .email:
                cell.phoneView.textField.isEnabled = true
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.isHiddenLabel(isHidden: true)
                cell.phoneView.textField.keyboardType = .default
                
//                if profileRealm?.email.count == 0  {
//                    cell.phoneView.textField.placeholder = row.placeholder ?? ""
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.email ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                return cell
            case .website:
                cell.phoneView.textField.isEnabled = true
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.isHiddenLabel(isHidden: true)
                cell.phoneView.textField.keyboardType = .default
//                if profileRealm?.website.count == 0  {
//                    cell.phoneView.textField.placeholder = row.placeholder ?? ""
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.website ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                return cell
            case .job:
                cell.phoneView.textField.isEnabled = true
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.isHiddenLabel(isHidden: true)
                cell.phoneView.textField.keyboardType = .default
//                if profileRealm?.job.count == 0 {
//                    cell.phoneView.textField.placeholder = row.placeholder ?? ""
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.job ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                return cell
            case .company:
                cell.phoneView.textField.isEnabled = true
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.isHiddenLabel(isHidden: true)
                cell.phoneView.textField.keyboardType = .default
//                if profileRealm?.company.count == 0 {
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.company ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                return cell
            case .street:
                cell.phoneView.textField.isEnabled = true
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.isHiddenLabel(isHidden: true)
                cell.phoneView.textField.keyboardType = .default
//                if profileRealm?.street.count == 0 {
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.street ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                return cell
            case .zip:
                cell.phoneView.textField.isEnabled = true
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.isHiddenLabel(isHidden: true)
                cell.phoneView.textField.keyboardType = .default
//                if profileRealm?.zip.count == 0 {
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.zip ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                return cell
            case .city:
                cell.phoneView.textField.isEnabled = true
                cell.phoneView.countryPhoneLabel.isHidden = true
                cell.phoneView.isHiddenTextField(isHidden: false)
                cell.phoneView.isHiddenImage(isHidden: true)
                cell.phoneView.isHiddenLabel(isHidden: true)
                cell.phoneView.textField.keyboardType = .default
//                if profileRealm?.city.count == 0 {
                    cell.phoneView.textField.attributedPlaceholder = NSAttributedString(
                        string: row.placeholder ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
                        ]
                    )
//                } else {
                    cell.phoneView.textField.attributedText = NSAttributedString(
                        string: profileRealm?.city ?? "",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.black
                        ]
                    )
//                }
                return cell
            default: break
            }
            
            
        }
        return UITableViewCell()
    }
}

//MARK: - Setup
private extension EditProfileController {
    func poiuhjkiuhnmjkuhnmkl() {
        setupTable()
        
        hidedsKevyrbovtabrdnWyheyhnyhtyTappedAround()
        
        cantainerView.layer.borderColor = UIColor.lightGray.cgColor
        cantainerView.layer.borderWidth = 1
        cantainerView.layer.cornerRadius = 10
        cantainerView.backgroundColor = .white
        self.view.backgroundColor = .init(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EditImageCell", bundle: nil), forCellReuseIdentifier: "EditImageCell")
        tableView.register(UINib(nibName: "EditGenderCell", bundle: nil), forCellReuseIdentifier: "EditGenderCell")
        tableView.register(UINib(nibName: "PhoneVerifyCell", bundle: nil), forCellReuseIdentifier: "PhoneVerifyCell")
    }
}

//MARK: - Enums
private extension EditProfileController {
    enum Rows: Int, CaseIterable {
        case image, firstName, lastName, gender, phone, email, website, job, company, street, zip, city, country
        
        var title: String? {
            switch self {
            case .firstName: return "firstName".localized()
            case .lastName: return "lastName".localized()
            case .gender: return "gender".localized()
            case .phone: return "phoneNum".localized()
            case .email: return "email".localized()
            case .website: return "website".localized()
            case .job: return "jobTitle".localized()
            case .company: return "company".localized()
            case .street: return "street".localized()
            case .zip: return "zipCode".localized()
            case .city: return "city".localized()
            case .country: return "country".localized()
            default: return nil
            }
        }
        
        var placeholder: String? {
            switch self {
            case .firstName: return "firstName".localized()
            case .lastName: return "lastName".localized()
            case .email: return "example@example.com"
            case .gender: return "genderP".localized()
            case .website: return "websiteP".localized()
            case .job: return "jobTitleP".localized()
            case .company: return "companyP".localized()
            case .street: return "streetP".localized()
            case .zip: return "zipCodeP".localized()
            case .city: return "cityP".localized()
            default: return nil
            }
        }
    }
}

struct EditInfo {
    var firstName = ""
    var lastName = ""
    var email = ""
    var phone = ""
    var gender = ""
    var website = ""
    var job = ""
    var company = ""
    var street = ""
    var zip = ""
    var city = ""
    var country = ""
}
