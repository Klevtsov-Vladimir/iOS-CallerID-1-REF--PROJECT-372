import UIKit

final class ProtectController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var premLabel: UILabel!
    @IBOutlet private weak var subLabel: UILabel!
    @IBOutlet private weak var descrLabel: UILabel!
    @IBOutlet private weak var butView: UIView!
    @IBOutlet private weak var butTitle: UILabel!
    @IBOutlet private weak var butSub: UILabel!
    
    public let inapp = IAASSFPManvdager.sharedTRTT
    private let networkingMonitor = NetworkStatusMonitor.sharedFFFR
    
    public weak var delegate : TradnsdsactsioddsnVdiwedwfEvfenfts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }
        setvgysddwup()
    }
    
}

//MARK: - UITableViewDelegate
//extension ProtectController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch Rows.allCases[indexPath.row] {
//        case .spamTutorial: return 381
//        case .blockList: return 64
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let row = Rows.allCases[indexPath.row]
//        switch row {
//        case .blockList:
//            let controller = BlockListController()
//            self.navigationController?.pushViewController(controller, animated: true)
//        default: break
//        }
//    }
//}

//MARK: - UITableViewDataSource
//extension ProtectController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        Rows.allCases.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let row = Rows.allCases[indexPath.row]
//
//        switch row {
//        case .spamTutorial:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpamProtectCell", for: indexPath) as? SpamProtectCell else { return UITableViewCell() }
//
//            cell.callback = {
//                let controller = PremiumSpamController()
//                controller.modalPresentationStyle = .fullScreen
//
//                self.present(controller, animated: true)
//            }
//
//            return cell
//        case .blockList:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindPhoneCell", for: indexPath) as? FindPhoneCell else { return UITableViewCell() }
//
//            cell.avatarLabel.isHidden = true
//            cell.containerAvatarImageView.backgroundColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 0.2)
//            cell.containerAvatarImageView.layer.cornerRadius = cell.containerAvatarImageView.frame.height / 2
//            cell.avatarImageView.image = #imageLiteral(resourceName: "callIconBlocked")
//            cell.titleLabel.text = "blockList".localized()
//            cell.subtitleLabel.text = "subSpam".localized()
//            cell.subtitleLabel.textColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 1)
//            cell.layer.cornerRadius = 10
//            cell.layer.borderColor = UIColor.lightGray.cgColor
//            cell.layer.borderWidth = 1
//
//            return cell
//        }
//    }
//}

//MARK: - Setup
private extension ProtectController {
    func setvgysddwup() {
        setuvrkenvwkjnvwodjnowjenfwoejnfpUI()
//        setupTable()
    }
    
    func setuvrkenvwkjnvwodjnowjenfwoejnfpUI() {
        navigationController?.navigationBar.isHidden = true
        titleLabel.text = "spamTitle".localized()
        titleLabel.font = .systemFont(ofSize: 30, weight: .medium)
        
        premLabel.text = "premium".localized()
        premLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        subLabel.text = "premiumSub".localized()
        subLabel.font = .systemFont(ofSize: 30, weight: .medium)
        
        descrLabel.text = "premiumDescr".localized()
        descrLabel.font = .systemFont(ofSize: 18, weight: .regular)
        descrLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        
        butView.layer.cornerRadius = 10
        butView.backgroundColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(continueAction))
        butView.addGestureRecognizer(gesture)
        
        butTitle.text = "buyNow".localized()
        butTitle.font = .systemFont(ofSize: 12, weight: .regular)
        butTitle.textColor = .white
        
        butSub.text = "2.99$ " + "forMonth".localized()
        butSub.font = .systemFont(ofSize: 18, weight: .medium)
        butSub.textColor = .white
        
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 10
    }
    
    @objc func continueAction() {
        inapp.productBuyERTET = .eiwgyrtidvbhiir
        inapp.transactionsDelegate = self
        networkingMonitor.startMonitoringRRRR()
        inapp.doPurchaseFSD()
    }
    
//    func setupTable() {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: "SpamProtectCell", bundle: nil), forCellReuseIdentifier: "SpamProtectCell")
//        tableView.register(UINib(nibName: "FindPhoneCell", bundle: nil), forCellReuseIdentifier: "FindPhoneCell")
//    }
}

extension ProtectController: IAPManasdcagerProtosacol {
    func infoAlertasdfasdfvbxxcvbdfghdfgh(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        UIApplication.shared.notificationFeedbackGeneratorXXXXS(type: .warning)
    }
    
    func rtrtrgoTerterertoTheAsaertetrtdfasfpdsafp() {
        NotificationCenter.default.post(name: NSNotification.Name("checkSpamPur"), object: nil)
    }
    
    func fnvjfvnfjnvfjvnfjvvfjvnfjvnfjvnfjvnfjvicjdsc() {
        
    }
}

//MARK: - Enums

