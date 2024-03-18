import UIKit

final class PremiumSpamController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

//MARK: - UITableViewDelegate
extension PremiumSpamController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = Rows.allCases[indexPath.row]
        switch row {
        case .blockList:
            let controller = BlockListController()
            self.navigationController?.pushViewController(controller, animated: true)
        case .alert:
            if !UserDefaults.standard.bool(forKey: "isEnabledExtension") {
                let controller = NotificationRequestController()
                controller.isFromSpam = true
                present(controller, animated: true)
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension PremiumSpamController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Rows.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Rows.allCases[indexPath.row]

        switch row {
//        case .liveCaller:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindPhoneCell", for: indexPath) as? FindPhoneCell else { return UITableViewCell() }
//
//            cell.avatarLabel.isHidden = true
//            cell.containerAvatarImageView.backgroundColor = .init(red: 115/255, green: 232/255, blue: 161/255, alpha: 0.2)
//            cell.containerAvatarImageView.layer.cornerRadius = cell.containerAvatarImageView.frame.height / 2
//            cell.avatarImageView.image = #imageLiteral(resourceName: "liveCall")
//            cell.titleLabel.text = "spamLive".localized()
//            cell.subtitleLabel.isHidden = true
//            cell.subtitleLabel.textColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 1)
//            cell.containerView.layer.cornerRadius = 10
//            cell.containerView.layer.borderColor = UIColor.lightGray.cgColor
//            cell.containerView.layer.borderWidth = 1
//
//            return cell
        case .alert:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindPhoneCell", for: indexPath) as? FindPhoneCell else { return UITableViewCell() }

            cell.avatarLabel.isHidden = true
            cell.containerAvatarImageView.backgroundColor = .init(red: 245/255, green: 194/255, blue: 111/255, alpha: 1)
            cell.containerAvatarImageView.layer.cornerRadius = cell.containerAvatarImageView.frame.height / 2
            cell.avatarImageView.image = #imageLiteral(resourceName: "warningSpam")
            cell.titleLabel.text = "callAlert".localized()
            
            if !UserDefaults.standard.bool(forKey: "isEnabledExtension") {
                cell.subtitleLabel.text = "off".localized()
                cell.arrowImage.isHidden = false
            } else {
                cell.subtitleLabel.text = "on".localized()
                cell.arrowImage.isHidden = true
            }
            
            cell.subtitleLabel.isHidden = false
            cell.subtitleLabel.textColor = .lightGray
            cell.containerView.layer.cornerRadius = 10
            cell.containerView.layer.borderColor = UIColor.lightGray.cgColor
            cell.containerView.layer.borderWidth = 1

            return cell
        case .blockList:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindPhoneCell", for: indexPath) as? FindPhoneCell else { return UITableViewCell() }
            cell.avatarLabel.isHidden = false

            cell.avatarLabel.isHidden = true
            cell.containerAvatarImageView.backgroundColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 0.2)
            cell.containerAvatarImageView.layer.cornerRadius = cell.containerAvatarImageView.frame.height / 2
            cell.avatarImageView.image = #imageLiteral(resourceName: "callIconBlocked")
            cell.titleLabel.text = "blockList".localized()
            cell.subtitleLabel.text = "subSpam".localized()
            cell.subtitleLabel.isHidden = false
            cell.subtitleLabel.textColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 1)
            cell.containerView.layer.cornerRadius = 10
            cell.containerView.layer.borderColor = UIColor.lightGray.cgColor
            cell.containerView.layer.borderWidth = 1

            return cell
        }
    }
}

//MARK: - Setup
private extension PremiumSpamController {
    func setup() {
        setudsfvadsfvpUI()
        setupTable()
    }
    
    func setudsfvadsfvpUI() {
        titleLabel.text = "spamTitle".localized()
        titleLabel.font = .systemFont(ofSize: 30, weight: .medium)
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FindPhoneCell", bundle: nil), forCellReuseIdentifier: "FindPhoneCell")
    }
}

private extension PremiumSpamController {
    enum Rows: Int, CaseIterable {
        case alert, blockList
    }
}
