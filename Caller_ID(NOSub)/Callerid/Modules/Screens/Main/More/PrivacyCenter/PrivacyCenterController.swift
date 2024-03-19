import UIKit

final class PrivacyCenterController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

//MARK: - Actions
private extension PrivacyCenterController {
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDelegate
extension PrivacyCenterController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 105
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = Rows.allCases[indexPath.row]
        
        switch row {
        case .ads:
            DispatchQueue.main.async {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }
        case .data:
            let controller = MoreDataController()
            navigationController?.pushViewController(controller, animated: true)
        case .account:
            break
        }
    }
}

//MARK: - UITableViewDataSource
extension PrivacyCenterController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Rows.allCases[indexPath.row]
        switch row {
        case .account:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeactiveAccCell", for: indexPath) as? DeactiveAccCell else { return UITableViewCell() }
            let row = Rows.allCases[indexPath.row]
            
            cell.callback = { [weak self] in
                let alert = UIAlertController(title: "privacyAccount".localized(), message: nil, preferredStyle: .actionSheet)
                
                let confirmAction = UIAlertAction(title: "confirm".localized(), style: .default) { _ in
                    AppDelegate.shared.setRootViewController(OnboardingSettingsController())
                    UserDefaults.standard.setValue(false, forKey: "phone")
                    UserDefaults.standard.setValue(false, forKey: "isSetProfileInfo")
                    CorasedasadRddealm.shared.reasdmasodvaeAasdlalsdsad()
                }
                let cancelAction = UIAlertAction(title: "cancel".localized(), style: .cancel)
                
                alert.addAction(confirmAction)
                alert.addAction(cancelAction)
                
                if let popoverController = alert.popoverPresentationController {
                    popoverController.sourceView = self?.view
                    popoverController.sourceRect = CGRect(x: self?.view.bounds.midX ?? 0, y: self?.view.bounds.midY ?? 0, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                }
                
                self?.present(alert, animated: true)
            }
            
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrivacyCell", for: indexPath) as? PrivacyCell else { return UITableViewCell() }
            let row = Rows.allCases[indexPath.row]
            
            cell.titleLabel.text = row.title
            cell.subtitleLabel.text = row.subtitle
            
            return cell
        }
        
    }
}

//MARK: - Setup
private extension PrivacyCenterController {
    func setup() {
        setupTable()
        
        navigationController?.navigationBar.isHidden = true
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        titleLabel.text = "privacyAccount".localized().uppercased()
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PrivacyCell", bundle: nil), forCellReuseIdentifier: "PrivacyCell")
        tableView.register(UINib(nibName: "DeactiveAccCell", bundle: nil), forCellReuseIdentifier: "DeactiveAccCell")
        
    }
}

//MARK: - Enums
private extension PrivacyCenterController {
    enum Rows: Int, CaseIterable {
        case ads, data, account
        
        var title: String {
            switch self {
            case .ads: return "privacyAds".localized()
            case .data: return "privacyData".localized()
            case .account: return "privacyAccount".localized()
            }
        }
        
        var subtitle: String? {
            switch self {
            case .ads: return "subPri".localized()
            case .data: return "subPri1".localized()
            case .account: return nil
            }
        }
    }
}
