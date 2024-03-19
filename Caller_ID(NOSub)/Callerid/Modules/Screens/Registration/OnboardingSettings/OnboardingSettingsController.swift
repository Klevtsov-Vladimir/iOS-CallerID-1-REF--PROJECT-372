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
private extension OnboardingSettingsController {
    @objc func checkCallIdentifier() {
        checkStatusExtension()
    }
    
    func checkStatusExtension(status: CXCallDirectoryManager.EnabledStatus? = nil) {
        //        isShowAlert = false
        if let status = status {
            getStatus(status: status)
        } else {
            CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
                DispatchQueue.main.async {
                    self.getStatus(status: status)
                }
            }
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
            let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
            
            let notNowAlertAction = UIAlertAction(title: "notNow".localized(), style: .destructive) { action in
                let controller = PhoneVerifyController()
                self.navigationController?.pushViewController(controller, animated: true)
                NotificationCenter.default.removeObserver(self)
            }
            let tryAgainAlertAction = UIAlertAction(title: "tryAgain".localized(), style: .default) { action in
                self.openSettings()
            }
            notNowAlertAction.setValue(UIColor(named: "textRed"), forKey: "titleTextColor")

            let attributedString = NSAttributedString(string: "callIdentTitleAlert".localized(), attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold),
                    NSAttributedString.Key.foregroundColor : UIColor(.white)
                    ])
            let attributedStringMessege = NSAttributedString(string: "callIdentMessageAlert".localized(), attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .regular),
                    NSAttributedString.Key.foregroundColor : UIColor(.white)
                    ])
            alert.setValue(attributedString, forKey: "attributedTitle")
            alert.setValue(attributedStringMessege, forKey: "attributedMessage")

            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "AlertBG")
            alert.view.tintColor = UIColor(named: "textBlue")
            
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
    
    func openSettings() {
        DispatchQueue.main.async {
            CXCallDirectoryManager.sharedInstance.openSettings { error in
                print(error)
            }
        }
    }
}


//MARK: - Actions
private extension OnboardingSettingsController {
    @IBAction func laterAction(_ sender: Any) {
        checkStatusExtension()
    }
}

//MARK: - UICollectionViewDataSource
extension OnboardingSettingsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RowsSpam.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
        return CGSize(width: collectionView.frame.width, height: 30)
    }
}

//MARK: - SetupUI
private extension OnboardingSettingsController {
    func setup() {
        sesadftufsdpUI()
        setupCollection()
        setupObservers()
    }
    
    func sesadftufsdpUI() {
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
        subtitleLabel.font = UIFont(name: "Manrope-Bold", size: 20)
        subtitleLabel.textColor = .white
        
        laterButton.setTitle("maybeLater".localized(), for: .normal)
        laterButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 16)
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
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "OnboardingSettingsCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingSettingsCell")
    }
    
    func setupObservers() {
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
        case .openPhone: return #imageLiteral(resourceName: "Name=Settings").withTintColor(.white)
        case .tapPhone: return #imageLiteral(resourceName: "call").withTintColor(.white)
        case .tapCall: return #imageLiteral(resourceName: "arrow-square-right").withTintColor(.white)
        case .turnOn: return #imageLiteral(resourceName: "Name=Switch").withTintColor(.white)
        case .returnTo: return #imageLiteral(resourceName: "call").withTintColor(UIColor(named: "PurpleButton") ?? .purple)
        }
    }
}
