import UIKit
import Contacts
import FirebaseDatabase
import FirebaseStorage
import PhoneNumberKit

final class FindPhoneController: UIViewController {
    @IBOutlet private weak var searchView: SearchView!
    @IBOutlet private weak var noResultsView: NoResultsView!
    @IBOutlet private weak var tableView: UITableView!
    
    private var filteredContacts = [CNContact]()
    private var contacts = [CNContact]()
    
    private var realm = CorasedasadRddealm.shared
    
    private let reference = Database.database().reference()
    
    private var phone = Phone(countryInfo: Countrydsfsdfsdddd(countries: countries.first?.countries) ) {
        didSet {
            showResView()
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContacts()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

//MARK: - Private methods
private extension FindPhoneController {
    func getContacts() {
        let keys = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNLabelPhoneNumberiPhone,
            CNLabelPhoneNumberMobile,
            CNLabelPhoneNumberMain,
            CNContactVCardSerialization.descriptorForRequiredKeys()
        ] as [Any]
        guard let keys = keys as? [CNKeyDescriptor] else { return }
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        let contactStore = CNContactStore()
        do {
            DispatchQueue.global().async {
                try? contactStore.enumerateContacts(with: request) {
                    (contact, stop) in
                    self.contacts.append(contact)
                }
            }
        }
    }
}

//MARK: - UITableViewDelegate
extension FindPhoneController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var contact = Contact()
        let contacts = filteredContacts.filter { contact in
            contact.phoneNumbers.contains(where: { phoneNum in
                phoneNum.value.stringValue.contains(self.phone.phone ?? "")
            })
        }
        if indexPath.row != 0 {
            contact.contact = contacts[indexPath.row - 1]
        }
        contact.address = phone.countryInfo?.countries?.name
        
        let dialCode = phone.countryInfo?.countries?.dialCode ?? ""
        let phone = dialCode + "\(phone.phone ?? "")"
        contact.phone = phone.replacingOccurrences(of: "+", with: "")
        contact.phoneWithoutDial = self.phone.phone ?? ""
        
        if contact.contact != nil {
            let phoneKit = PhoneNumberKit()
            let phoneContactKit = try? phoneKit.parse(contact.contact?.phoneNumbers.first?.value.stringValue as? String ?? "")
            if phoneContactKit == nil {
                let alert = UIAlertController(title: "Error", message: "Invalid phone", preferredStyle: .alert)
                let notNowAlertAction = UIAlertAction(title: "Ok", style: .destructive) { action in
                    
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
                return
            }
            let actual = String(phoneContactKit?.countryCode ?? 0) + String(phoneContactKit?.nationalNumber ?? 0)
            reference.child("users").child(actual).observeSingleEvent(of: .value) { [weak self] snapshot in
                if snapshot.hasChild("viewedPhones") {
                    if var ar = (snapshot.value as? [String:Any])?["viewedPhones"] as? [String] {
                        ar.append(UserDefaults.standard.string(forKey: "phone") ?? "")
                        self?.reference.child("users").child(actual).child("viewedPhones").setValue(ar)
                    }
                } else {
                    let array = [UserDefaults.standard.string(forKey: "phone") ?? ""]
                    self?.reference.child("users").child(actual).child("viewedPhones").setValue(array)
                }
                
                if snapshot.hasChild("firstNameArr") {
                    if var ar = (snapshot.value as? [String:Any])?["firstNameArr"] as? [String] {
                        ar.append(self?.realm.profileDB.first?.firstName ?? "")
                        self?.reference.child("users").child(actual).child("firstNameArr").setValue(ar)
                    }
                } else {
                    let array = [self?.realm.profileDB.first?.firstName ?? ""]
                    self?.reference.child("users").child(actual).child("firstNameArr").setValue(array)
                }
                
                if snapshot.hasChild("lastNameArr") {
                    if var ar = (snapshot.value as? [String:Any])?["lastNameArr"] as? [String] {
                        ar.append(self?.realm.profileDB.first?.lastName ?? "")
                        self?.reference.child("users").child(actual).child("lastNameArr").setValue(ar)
                    }
                } else {
                    let array = [self?.realm.profileDB.first?.lastName ?? ""]
                    self?.reference.child("users").child(actual).child("lastNameArr").setValue(array)
                }
                
                if snapshot.hasChild("viewedDate") {
                    if var ar = (snapshot.value as? [String:Any])?["viewedDate"] as? [String] {
                        let dated = Date()
//
//                        let dateFormatter = DateFormatter()
//                        dateFormatter.dateFormat = "HH:mm"
//
//                        // Convert Date to String
//                        dateFormatter.string(from: dated)
//                        
//                        let str = dateFormatter.string(from: dated)
                        
                        ar.append(dated.timeIntervalSince1970.description)
                        self?.reference.child("users").child(actual).child("viewedDate").setValue(ar)
                    }
                } else {
                    let dated = Date()

//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "HH:mm"
//
//                    // Convert Date to String
//                    dateFormatter.string(from: dated)
//                    
//                    let str = dateFormatter.string(from: dated)
                    let array = [dated.timeIntervalSince1970.description]
                    self?.reference.child("users").child(actual).child("viewedDate").setValue(array)
                }
            }
        } else {
            let phoneKit = PhoneNumberKit()
            var phoneContactKit = try? phoneKit.parse(contact.phone ?? "")
                        
                        if phoneContactKit == nil {
                            phoneContactKit = try? phoneKit.parse("+" + (contact.phone ?? ""))
                        }
            
            
            if phoneContactKit == nil {
                let alert = UIAlertController(title: "Error", message: "Invalid phone", preferredStyle: .alert)
                let notNowAlertAction = UIAlertAction(title: "Ok", style: .destructive) { action in
                    
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
                return
            }
            let actual = String(phoneContactKit?.countryCode ?? 0) + String(phoneContactKit?.nationalNumber ?? 0)
            reference.child("users").child(actual).observeSingleEvent(of: .value) { [weak self] snapshot in
                if snapshot.hasChild("viewedPhones") {
                    if var ar = (snapshot.value as? [String:Any])?["viewedPhones"] as? [String] {
                        print("true")
                        ar.append(UserDefaults.standard.string(forKey: "phone") ?? "")
                        self?.reference.child("users").child(actual).child("viewedPhones").setValue(ar)
                    }
                } else {
                    let array = [UserDefaults.standard.string(forKey: "phone") ?? ""]
                    self?.reference.child("users").child(actual).child("viewedPhones").setValue(array)
                }
                
                if snapshot.hasChild("firstNameArr") {
                    if var ar = (snapshot.value as? [String:Any])?["firstNameArr"] as? [String] {
                        ar.append(self?.realm.profileDB.first?.firstName ?? "")
                        self?.reference.child("users").child(actual).child("firstNameArr").setValue(ar)
                    }
                } else {
                    let array = [self?.realm.profileDB.first?.firstName ?? ""]
                    self?.reference.child("users").child(actual).child("firstNameArr").setValue(array)
                }
                
                if snapshot.hasChild("lastNameArr") {
                    if var ar = (snapshot.value as? [String:Any])?["lastNameArr"] as? [String] {
                        ar.append(self?.realm.profileDB.first?.lastName ?? "")
                        self?.reference.child("users").child(actual).child("lastNameArr").setValue(ar)
                    }
                } else {
                    let array = [self?.realm.profileDB.first?.lastName ?? ""]
                    self?.reference.child("users").child(actual).child("lastNameArr").setValue(array)
                }
                
                
                if snapshot.hasChild("viewedDate") {
                    if var ar = (snapshot.value as? [String:Any])?["viewedDate"] as? [String] {
                        let dated = Date()

//                        let dateFormatter = DateFormatter()
//                        dateFormatter.dateFormat = "HH:mm"
//
//                        // Convert Date to String
//                        dateFormatter.string(from: dated)
//                        
//                        let str = dateFormatter.string(from: dated)
                        ar.append(dated.timeIntervalSince1970.description)
                        self?.reference.child("users").child(actual).child("viewedDate").setValue(ar)
                    }
                } else {
                    let dated = Date()

//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "HH:mm"
//
//                    // Convert Date to String
//                    dateFormatter.string(from: dated)
//                    
//                    let str = dateFormatter.string(from: dated)
                    let array = [dated.timeIntervalSince1970.description]
                    self?.reference.child("users").child(actual).child("viewedDate").setValue(array)
                }
            }
        }
        
        let controller = PhoneInfoController(contact: contact)
        hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
        hidesBottomBarWhenPushed = false
    }
}

//MARK: - UITableViewDataSource
extension FindPhoneController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (phone.phone?.isEmpty ?? false) || phone.phone == nil {
            return 0
        } else {
            let contacts = filteredContacts.filter { contact in
                contact.phoneNumbers.contains(where: { phoneNum in
                    phoneNum.value.stringValue.contains(self.phone.phone ?? "")
                })
            }
            return contacts.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindPhoneCell", for: indexPath) as? FindPhoneCell else { return UITableViewCell() }
                
        let dialCode = phone.countryInfo?.countries?.dialCode ?? ""
        let phone = dialCode + " \(phone.phone ?? "")"
        
        if indexPath.row == 0 {
            cell.avatarLabel.isHidden = true
            cell.containerAvatarImageView.isHidden = false
            cell.titleLabel.text = phone
        } else {
            cell.avatarLabel.isHidden = false
            cell.containerAvatarImageView.isHidden = true
            
            let contacts = filteredContacts.filter { contact in
                contact.phoneNumbers.contains(where: { phoneNum in
                    phoneNum.value.stringValue.contains(self.phone.phone ?? "")
                })
            }
            
            let contactPhone = contacts[indexPath.row - 1].phoneNumbers.first?.value.stringValue.replacingOccurrences(of: "+", with: "").replacingOccurrences(of: " ", with: "")
            
            let realmPhone = realm.profileDB.first?.historyPhoneSearch.filter({ history in
                history.phoneNumber == contactPhone && history.name != contactPhone
            }).first
            if realmPhone != nil {
                cell.titleLabel.text = realmPhone?.name
            } else {
                cell.titleLabel.text = "\(contacts[indexPath.row - 1].givenName) \(contacts[indexPath.row - 1].familyName)"
            }
            
            cell.subtitleLabel.isHidden = true
            
            let nameFirstLiteral = contacts[indexPath.row - 1].givenName.prefix(1)
            let familyFirstName = contacts[indexPath.row - 1].familyName.prefix(1)
            cell.avatarLabel.text = "\(nameFirstLiteral)\(familyFirstName)"
        }
        cell.subtitleLabel.text = self.phone.countryInfo?.countries?.name
        
        return cell
    }
}

//MARK: - Setup
private extension FindPhoneController {
    func setup() {
        sesdvcxvvbrwtupUI()
        setupTable()
        setupSearchView()
        hideKeyboardWhenTappedAround()
    }
    
    func sesdvcxvvbrwtupUI() {
        showResView()
        noResultsView.titleLabel.text = "noResTitle".localized()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FindPhoneCell", bundle: nil), forCellReuseIdentifier: "FindPhoneCell")
    }
    
    func showResView() {
        if (phone.phone?.isEmpty ?? false) || phone.phone == nil {
            noResultsView.isHidden = false
            tableView.isHidden = true
        } else {
            noResultsView.isHidden = true
            tableView.isHidden = false
        }
    }
    
    func setupSearchView() {
       
        let country = countries.filter { country in
            return country.countries?.code == "US"
        }
        
        self.phone = Phone(countryInfo: country.first)
        
        self.searchView.numberLabel?.text = country.first?.countries?.dialCode
        
        
        searchView.textField.resignFirstResponder()
        searchView.cancelCallback = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        searchView.clearCallback = { [weak self] in
            self?.phone.phone = ""
        }
        
        searchView.textChangedCallback = { [weak self] phone in
            let contacts = self?.contacts.filter { contact in
                contact.phoneNumbers.contains(where: { phoneNum in
                    phoneNum.value.stringValue.contains(self?.phone.phone ?? "")
                })
            }
            self?.filteredContacts = contacts ?? []
            self?.phone.phone = phone
            
        }
        
        searchView.numberViewCallback = { [weak self] in
            let controller = CountriesListController()
            controller.callback = { [weak searchView = self?.searchView] country in
                self?.phone.countryInfo?.countries = country.countries
                searchView?.numberLabel?.text = country.countries?.dialCode
                self?.tableView.reloadData()
            }
            
            self?.present(controller, animated: true)
        }
    }
}
