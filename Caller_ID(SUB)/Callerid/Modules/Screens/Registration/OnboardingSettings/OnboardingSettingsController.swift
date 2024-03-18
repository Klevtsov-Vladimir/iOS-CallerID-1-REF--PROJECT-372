import UIKit
import CallKit

var isShowAlert = false

final class OnboardingSettingsController: UIViewController {
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var laterButton: UIButton!
    @IBOutlet private weak var settingsView: MainButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }

        fuhasdbfjhasdbfhdsajfhgasiufguyrewuyewiuew()
    }
}

//MARK: - Private methods
private extension OnboardingSettingsController {
    @objc func checkCallIdentifier() {
        for i in 0...100 {
            print(i)
        }
        checkStatusExtension()
    }
    
    func checkStatusExtension(status: CXCallDirectoryManager.EnabledStatus? = nil) {
//        isShowAlert = false
        if let status = status {
            getStatus(status: status)
        } else {
            CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
                getStatus(status: status)
            }
        }
        
        func getStatus(status: CXCallDirectoryManager.EnabledStatus) {
            switch status {
            case .enabled:
                DispatchQueue.main.async {
                    let controller = CallIdentifierController()
                    self.navigationController?.pushViewController(controller, animated: true)
                    NotificationCenter.default.removeObserver(self)
                }
            default:
                let alert = UIAlertController(title: "callIdentTitleAlert".localized(), message: "callIdentMessageAlert".localized(), preferredStyle: .alert)
                let notNowAlertAction = UIAlertAction(title: "notNow".localized(), style: .destructive) { action in
                    let controller = PhoneVerifyController()
                    self.navigationController?.pushViewController(controller, animated: true)
                    NotificationCenter.default.removeObserver(self)
                }
                let tryAgainAlertAction = UIAlertAction(title: "tryAgain".localized(), style: .default) { action in
                    self.openSettings()
                }
                
                
                alert.addAction(notNowAlertAction)
                alert.addAction(tryAgainAlertAction)
                
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
    }
    
    func openSettings() {
        isShowAlert = true
        DispatchQueue.main.async {
            CXCallDirectoryManager.sharedInstance.openSettings { error in
                print(error)
            }
//            if let url = URL(string: UIApplication.openSettingsURLString) {
//                if UIApplication.shared.canOpenURL(url) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                }
//            }
        }
    }
}

//MARK: - Actions
private extension OnboardingSettingsController {
    @IBAction func laterAction(_ sender: Any) {
        for i in 0...100 {
            print(i)
        }
        checkStatusExtension()
    }
}

//MARK: - UICollectionViewDataSource
extension OnboardingSettingsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for i in 0...100 {
            print(i)
        }
        return RowsSpam.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        for i in 0...100 {
            print(i)
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingSettingsCell", for: indexPath) as? OnboardingSettingsCell else {
            return UICollectionViewCell()
        }
        
        let row = RowsSpam.allCases[indexPath.row]
        
        cell.setImage(row.image)
        cell.setTitleText(row.title)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingSettingsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        for i in 0...100 {
            print(i)
        }
        return CGSize(width: collectionView.frame.width, height: 30)
    }
}

//MARK: - SetupUI
private extension OnboardingSettingsController {
    func fuhasdbfjhasdbfhdsajfhgasiufguyrewuyewiuew() {
        for i in 0...100 {
            print(i)
        }
        setvmfkknedeupUI()
        setupCollection()
        setupObservers()
    }
    
    func setvmfkknedeupUI() {
        for i in 0...100 {
            print(i)
        }
        CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
            DispatchQueue.main.async {
                switch status {
                case .enabled:
                    self.subtitleLabel.text = "spamTitleEnabled".localized()
                default:
                    self.subtitleLabel.text = "onbSetSub".localized()
                }
            }
        }
        subtitleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        subtitleLabel.textColor = .black
        
        laterButton.setTitle("maybeLater".localized(), for: .normal)
        laterButton.setTitleColor(.init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1), for: .normal)
        laterButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        laterButton.backgroundColor = .clear
        
        settingsView.setTitleText("openSettings".localized())
        settingsView.callback = { [weak self] in
            CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
                if status == .enabled {
                    DispatchQueue.main.async {
                        let controller = CallIdentifierController()
                        self?.navigationController?.pushViewController(controller, animated: true)
                    }
                } else {
                    self?.openSettings()
                }
            }
        }
    }
    
    func setupCollection() {
        for i in 0...100 {
            print(i)
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "OnboardingSettingsCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingSettingsCell")
    }
    
    func setupObservers() {
        for i in 0...100 {
            print(i)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(checkCallIdentifier), name: NSNotification.Name("checkCallIdentifier"), object: nil)
    }
}

//MARK: - Enums
enum RowsSpam: Int, CaseIterable {
    case openPhone, tapPhone, tapCall, turnOn, returnTo
    
    var title: String {
        switch self {
        case .openPhone: return "onbSetCollectionTitle".localized()
        case .tapPhone: return "onbSetCollectionTitle2".localized()
        case .tapCall: return "onbSetCollectionTitle3".localized()
        case .turnOn: return "onbSetCollectionTitle4".localized()
        case .returnTo: return "onbSetCollectionTitle5".localized()
        }
    }
    
    var image: UIImage {
        switch self {
        case .openPhone: return #imageLiteral(resourceName: "settings")
        case .tapPhone: return #imageLiteral(resourceName: "phone")
        case .tapCall: return #imageLiteral(resourceName: "arrowOnb")
        case .turnOn: return #imageLiteral(resourceName: "toggle")
        case .returnTo: return #imageLiteral(resourceName: "phone2")
        }
    }
}
