import UIKit
import Contacts
import RealmSwift
import CallKit

final class ResultsPhonesController: UIViewController {
    @IBOutlet private weak var callsIdentTernView: CallsIndentTern!
    @IBOutlet private weak var noResultsView: NoResultsView!
    @IBOutlet private(set) weak var tableView: UITableView!
    
    private let realm = CorasedasadRddealm.shared
    private var contacts = [CNContact]()
    
    private var realmN = try! Realm(configuration: ReaSDFSlmSerDFvice.config)
    
    var didSelectCallback: ((UIViewController)->())?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTurnOnView), name: NSNotification.Name("updateTurnOnView"), object: nil)
        getContacts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkEmptyness()
        tableView.reloadData()
        
        CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
            DispatchQueue.main.async {
                switch status {
                case .enabled:
                    self.callsIdentTernView.isHidden = true
                default:
                    self.callsIdentTernView.isHidden = false
                }
            }
        }
    }
    
    @objc func updateTurnOnView() {
            CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
                DispatchQueue.main.async {
                    switch status {
                    case .enabled:
                        self.callsIdentTernView.isHidden = true
                    default:
                        self.callsIdentTernView.isHidden = false
                    }
                }
            }
        }
    
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
extension ResultsPhonesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var contact = Contact()
        
        let realmPhone = realm.profileDB.first?.historyPhoneSearch[indexPath.row]
        let contactC = contacts.filter { contactM in
            let phone = contactM.phoneNumbers.first?.value.stringValue.replacingOccurrences(of: "+", with: "").replacingOccurrences(of: " ", with: "")
            return realmPhone?.phoneNumber == phone
        }.first
        
        contact.contact = contactC
        contact.phone = realmPhone?.phoneNumber
        contact.address = realmPhone?.country
        let controller = PhoneInfoController(contact: contact)
        didSelectCallback?(controller)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            try! realmN.write {
                let history = realm.profileDB.first?.historyPhoneSearch[indexPath.row]
                realmN.delete(history ?? HistoryPhoneSearch())
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.checkEmptyness()
                }
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension ResultsPhonesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.profileDB.first?.historyPhoneSearch.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindPhoneCell", for: indexPath) as? FindPhoneCell else { return UITableViewCell() }
        
        let history = realm.profileDB.first?.historyPhoneSearch[indexPath.row]
        let isEmptyName = ((history?.firstName ?? "") + (history?.lastName ?? "")) == "" ? true : false
        if isEmptyName {
            cell.avatarLabel.isHidden = true
            cell.containerAvatarImageView.isHidden = false
        } else {
            cell.avatarLabel.isHidden = false
            cell.avatarLabel.text = (history?.firstName ?? "").prefix(1) + " " + (history?.lastName ?? "").prefix(1)
            cell.containerAvatarImageView.isHidden = true
        }
        
        cell.titleLabel.text = history?.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, H:mm"
        cell.dateLabel.text = dateFormatter.string(from: history?.dateChanged ?? Date())
        cell.subtitleLabel.text = history?.phoneNumber
        
        return cell
    }
}

//MARK: - Setup
private extension ResultsPhonesController {
    func setup() {
        setupttyyyUI()
        setupTable()
    }
    
    func checkEmptyness() {
        if (realm.profileDB.first?.historyPhoneSearch.isEmpty ?? false) {
            noResultsView.isHidden = false
            tableView.isHidden = true
        } else {
            noResultsView.isHidden = true
            tableView.isHidden = false
        }
    }
    
    func setupttyyyUI() {
        CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
            DispatchQueue.main.async {
                switch status {
                case .enabled:
                    self.callsIdentTernView.isHidden = true
                default:
                    self.callsIdentTernView.isHidden = false
                }
            }
        }
        
        callsIdentTernView.titleLabel.text = "turnOnTitle".localized()
        callsIdentTernView.subtitleLabel.text = "turnOnSubtitle".localized()
        callsIdentTernView.layer.cornerRadius = 10
        
        callsIdentTernView.turnCallback = {
            CXCallDirectoryManager.sharedInstance.openSettings { error in
                print(error)
            }
        }
        
        noResultsView.titleLabel.text = "noResTitle".localized()
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FindPhoneCell", bundle: nil), forCellReuseIdentifier: "FindPhoneCell")
    }
}
