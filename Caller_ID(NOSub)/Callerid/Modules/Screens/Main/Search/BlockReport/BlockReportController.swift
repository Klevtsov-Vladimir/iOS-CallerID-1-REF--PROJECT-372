import UIKit
import RealmSwift

final class BlockReportController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    
    @IBOutlet weak var containerBottomConst: NSLayoutConstraint!
    
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
    
    var contact = Contact()
    
    private var selectedType = BetterNameSelectedType.bussines
    
    private var name = ""
    
    var callback: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        setup()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let model = UIDevice.model
        let isNew = model == .iPhone12 || model == .iPhone11 || model == .iPhone11Pro || model == .iPhone11ProMax || model == .iPhone12Pro || model == .iPhone12ProMax || model == .iPhoneX || model == .iPhoneXR || model == .iPhoneXS || model == .iPhoneXSMax || model == .undefined
        let keyboardTypeInfo = isNew == true ? UIResponder.keyboardFrameEndUserInfoKey : UIResponder.keyboardFrameBeginUserInfoKey
        if let keyboardSize = (notification.userInfo?[keyboardTypeInfo] as? NSValue)?.cgRectValue, self.containerBottomConst.constant == 0 {
            self.containerBottomConst.constant += keyboardSize.height
            
            view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let model = UIDevice.model
        let isNew = model == .iPhone12 || model == .iPhone11 || model == .iPhone11Pro || model == .iPhone11ProMax || model == .iPhone12Pro || model == .iPhone12ProMax || model == .iPhoneX || model == .iPhoneXR || model == .iPhoneXS || model == .iPhoneXSMax || model == .undefined
        let keyboardTypeInfo = isNew == true ? UIResponder.keyboardFrameEndUserInfoKey : UIResponder.keyboardFrameBeginUserInfoKey
        if let _ = (notification.userInfo?[keyboardTypeInfo] as? NSValue)?.cgRectValue {
            self.containerBottomConst.constant = 0
            view.layoutIfNeeded()
        }
    }
}

//MARK: - Private methods
private extension BlockReportController {
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
            switch type {
            case .add(let num):
                if let arr = (userDefaults?.value(forKey: "blockIdent")) as? [String:String] {
                    
                } else {
                    userDefaults?.set(num, forKey: "blockIdent")
                }
                
                DatabaseManager.shared.setNewPhoneIdent(phone: num)
                userDefaults?.set(num, forKey: "blockNumbers")
                
                
                try! realmN.write {
                    realmPhone.name = num.first?.value ?? "error"
                    realmPhone.isBlocked = true
                }
                
                callExt()
                DispatchQueue.main.async {
                    self.dismiss(animated: true)
                }
            default: break
            }
            
            return
        }
        switch type {
        case .add(let number):
            array[(number.keys.first ?? "")] = number.values.first ?? "error"
            
            DatabaseManager.shared.setNewPhoneIdent(phone: number)
            
            try! realmN.write {
                realmPhone.name = number.first?.value ?? "error"
                realmPhone.isBlocked = true
            }
        default: break
        }
        
        
        let sorted = array.sorted { first, second in
            let a = Int(first.key) ?? 0
            let b = Int(second.key) ?? 0
            return a < b
        }
        
        let newArr = Dictionary(uniqueKeysWithValues: sorted)
        
        userDefaults?.set(newArr, forKey: "blockIdent")
        userDefaults?.set(newArr, forKey: "blockNumbers")
        callExt()
        DispatchQueue.main.async {
            self.dismiss(animated: true) { [weak self] in
                self?.callback?()
            }
        }
        
        func callExt() {
            CallDirectoryManagerUtils.reloadExtension {
                
            }
        }
    }
}

//MARK: - UITableViewDelegate
extension BlockReportController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = Rows.allCases[indexPath.row]
        
        switch row {
        case .close: return 70
        case .blockReport: return 180
//        case .bussines: return 85
//        case .personal: return 80
        case .name: return 100
        case .block: return 190
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = Rows.allCases[indexPath.row]
        
//        switch row {
//        case .bussines: selectedType = .bussines
//        case .personal: selectedType = .person
//        default: break
//        }
        
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource
extension BlockReportController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Rows.allCases[indexPath.row]
        
        switch row {
        case .close:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BLockCloseCell", for: indexPath) as? BLockCloseCell else { return UITableViewCell() }
            
            cell.callback = { [weak self] in
                self?.dismiss(animated: true)
            }
            
            return cell
            
        case .blockReport:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BlockReportCell", for: indexPath) as? BlockReportCell else { return UITableViewCell() }
            
            if contact.contact == nil {
                cell.titleLabel.text = "blockReport".localized() + " " + (contact.phone ?? "")
            } else {
                cell.titleLabel.text = "blockReport".localized() + " " + (contact.contact?.phoneNumbers.first?.value.stringValue ?? "")
            }
            
            
            
            return cell
//        case .bussines:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BlockNumTypeCell", for: indexPath) as? BlockNumTypeCell else { return UITableViewCell() }
//
//            cell.titleTypeLabel.text = "business".localized()
//            cell.titleLabel.isHidden = false
//            cell.titleLabel.text = "businnesTitle".localized()
//
//            if selectedType == .bussines {
//                cell.boxImageView.image = #imageLiteral(resourceName: "checkBoxSelected")
//            } else {
//                cell.boxImageView.image = #imageLiteral(resourceName: "checkBoxUnselected")
//            }
//
//            return cell
//        case .personal:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BlockNumTypeCell", for: indexPath) as? BlockNumTypeCell else { return UITableViewCell() }
//
//            cell.titleTypeLabel.text = "personal".localized()
//            cell.titleLabel.isHidden = true
//
//            if selectedType == .person {
//                cell.boxImageView.image = #imageLiteral(resourceName: "checkBoxSelected")
//            } else {
//                cell.boxImageView.image = #imageLiteral(resourceName: "checkBoxUnselected")
//            }
//
//            return cell
        case .name:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BlockNameCell", for: indexPath) as? BlockNameCell else { return UITableViewCell() }
            
            cell.phoneView.textField.isHidden = false
            cell.phoneView.setPlaceholder("blockPlaceholderName".localized())
            cell.phoneView.countryImageView.isHidden = true
            cell.phoneView.titleLabel.text = "blockTitleName".localized()
            cell.phoneView.countryPhoneLabel.isHidden = true
            cell.phoneView.textField.keyboardType = .default
            
            cell.phoneView.textFieldDidChange = { [weak self] text in
                self?.name = text
            }
            
            return cell
        case .block:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BlockButtonCell", for: indexPath) as? BlockButtonCell else { return UITableViewCell() }
            
            let contactPhoneReplace = (self.contact.contact?.phoneNumbers.first?.value.stringValue ?? "")
                .replacingOccurrences(of: "+", with: "")
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "(", with: "")
                .replacingOccurrences(of: ")", with: "")
            let phoneReplace = self.contact.phone?
                .replacingOccurrences(of: "+", with: "")
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
            
            var phone = realmPhone.phoneNumberWithDial
                           .replacingOccurrences(of: "+", with: "")
                           .replacingOccurrences(of: " ", with: "")
                           .replacingOccurrences(of: "(", with: "")
                           .replacingOccurrences(of: ")", with: "")
            
            cell.blockButtonView.isRedBlock = true
            cell.blockButtonView.setTitleText("block".localized())
            cell.blockButtonView.callback = { [weak cell, weak self] in
                if self?.name.count == 0 {
                    let cellText = self?.tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? BlockNameCell
                    cellText?.phoneView.animateBorder()
                } else {
                    self?.blockNumber(type: .add(number: [phone : (self?.name ?? "")]))
                }
            }
            
            return cell
        }
    }
}

//MARK: - Setup
private extension BlockReportController {
    func setup() {
        setupTable()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            containerHeight.constant = 550
        } else {
            containerHeight.constant = 440
        }
        
        hideKeyboardWhenTappedAround()
        
//        view.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BlockReportCell", bundle: nil), forCellReuseIdentifier: "BlockReportCell")
        tableView.register(UINib(nibName: "BlockNumTypeCell", bundle: nil), forCellReuseIdentifier: "BlockNumTypeCell")
        tableView.register(UINib(nibName: "BlockNameCell", bundle: nil), forCellReuseIdentifier: "BlockNameCell")
        tableView.register(UINib(nibName: "BlockButtonCell", bundle: nil), forCellReuseIdentifier: "BlockButtonCell")
        tableView.register(UINib(nibName: "BLockCloseCell", bundle: nil), forCellReuseIdentifier: "BLockCloseCell")
        
        tableView.backgroundColor = .white
    }
}

//MARK: - Enums
private extension BlockReportController {
    enum Rows: Int, CaseIterable {
        case close, blockReport, name, block
    }
}
