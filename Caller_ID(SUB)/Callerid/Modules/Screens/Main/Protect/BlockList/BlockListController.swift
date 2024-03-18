import UIKit
import RealmSwift
import Contacts

final class BlockListController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var noResView: NoResultsView!
    
    private var coreRealm = CorasedasadRddealm.shared
    private var contacts = [CNContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rfewwdcsdcdscsdcewfcvcsfevtrhrtgvcwdcw()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkEmptyness()
        tableView.reloadData()
    }
}

//MARK: - Private methods
private extension BlockListController {
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

//MARK: - Actions
private extension BlockListController {
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDelegate
extension BlockListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var contact = Contact()
        
        let realmPhone = Array(coreRealm.profileDB.first?.historyPhoneSearch ?? List<HistoryPhoneSearch>()).filter({$0.isBlocked == true})[indexPath.row]
        let contactC = contacts.filter { contactM in
            let phone = contactM.phoneNumbers.first?.value.stringValue.replacingOccurrences(of: "+", with: "").replacingOccurrences(of: " ", with: "")
            return realmPhone.phoneNumber == phone
        }.first
        
        contact.contact = contactC
        contact.phone = realmPhone.phoneNumber
        contact.address = realmPhone.country
        
        let controller = PhoneInfoController(contact: contact)
        hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
        hidesBottomBarWhenPushed = false
    }
}

//MARK: - UITableViewDataSource
extension BlockListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(coreRealm.profileDB.first?.historyPhoneSearch ?? List<HistoryPhoneSearch>()).filter({$0.isBlocked == true}).count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindPhoneCell", for: indexPath) as? FindPhoneCell else { return UITableViewCell() }
        
        let blockedHistory = Array(coreRealm.profileDB.first?.historyPhoneSearch ?? List<HistoryPhoneSearch>()).filter({$0.isBlocked == true})[indexPath.row]
        cell.avatarLabel.isHidden = true
        cell.containerAvatarImageView.backgroundColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 0.2)
        cell.containerAvatarImageView.layer.cornerRadius = cell.containerAvatarImageView.frame.height / 2
        cell.avatarImageView.image = #imageLiteral(resourceName: "callIconBlocked")
        cell.titleLabel.text = blockedHistory.name
        cell.subtitleLabel.text = blockedHistory.phoneNumberWithDial
        cell.subtitleLabel.textColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 1)
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.borderColor = UIColor.lightGray.cgColor
        cell.containerView.layer.borderWidth = 1
        
        return cell
    }
}

//MARK: - Setup
private extension BlockListController {
    func checkEmptyness() {
        if (coreRealm.profileDB.first?.historyPhoneSearch.isEmpty ?? false) {
            noResView.isHidden = false
            tableView.isHidden = true
        } else {
            noResView.isHidden = true
            tableView.isHidden = false
        }
    }
    
    func rfewwdcsdcdscsdcewfcvcsfevtrhrtgvcwdcw() {
        sewdkjfntupUsdfdsfsdfI()
        setupTable()
        navigationController?.navigationBar.isHidden = true
    }
    
    func sewdkjfntupUsdfdsfsdfI() {
        checkEmptyness()
        noResView.titleLabel.text = "noResTitle".localized()
        titleLabel.text = "blockList".localized().uppercased()
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FindPhoneCell", bundle: nil), forCellReuseIdentifier: "FindPhoneCell")
    }
}
