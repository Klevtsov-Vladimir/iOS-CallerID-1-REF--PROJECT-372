import UIKit
import CallKit
import FloatingPanel

final class SearchController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var searchLabel: UILabel!
    @IBOutlet var callsIndentTurn: CallsIndentTern!
    @IBOutlet var SearchImage: UIImageView!
    
    private var floatingPanel: FloatingPanelController?
    private lazy var resultsController = ResultsPhonesController()
    
    private var realm = CorasedasadRddealm.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(checkBlockTurned), name: NSNotification.Name("checkBlockTurned"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTurnOnView), name: NSNotification.Name("updateTurnOnView"), object: nil)
        
        setup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addGradient(colors: [UIColor(named: "bg1stColor") ?? .clear, UIColor(named: "bg2ndColor") ?? .clear],
                         startPoint: CGPoint(x: 0.5, y: 0),
                         endPoint: CGPoint(x: 0.5, y: 1))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
            DispatchQueue.main.async {
                switch status {
                case .enabled:
                    self.callsIndentTurn.isHidden = true
                default:
                    self.callsIndentTurn.isHidden = false
                }
            }
        }
    }
//    @objc func checkBlockTurned() {
//        DispatchQueue.main.async {
//            self.resultsController.tableView.reloadData()
//        }
//    }
    @objc func updateTurnOnView() {
            CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
                DispatchQueue.main.async {
                    switch status {
                    case .enabled:
                        self.callsIndentTurn.isHidden = true
                    default:
                        self.callsIndentTurn.isHidden = false
                    }
                }
            }
        }
}

//MARK: - Private methods
private extension SearchController {
    @objc func searchTapped() {
        let controller = FindPhoneController()
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .fullScreen
        
        present(navigation, animated: true)
    }
}

//MARK: - Setup
private extension SearchController {
    func setup() {
        sssadeqwetupUI()
//        setupFloatingPanel()
        setUpCallsIndentTern()
        
        #warning("remove this")
        if realm.profileDB.isEmpty {
            realm.addUser(model: ProfileDB())
        }
    }
    
    func sssadeqwetupUI() {
        if let searchImage = UIImage(named: "Search") {
            let tintedImage = searchImage.withRenderingMode(.alwaysTemplate)
            SearchImage.image = tintedImage
            SearchImage.tintColor = UIColor(named: "textLightGrey")
        }

        
        titleLabel.text = "welcome".localized() + ","
        titleLabel.textColor = .white
        
        subtitleLabel.text = "\(CorasedasadRddealm.shared.profileDB.first?.firstName ?? "") \(CorasedasadRddealm.shared.profileDB.first?.lastName ?? "")"
        subtitleLabel.textColor = .white
        subtitleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        searchView.layer.cornerRadius = 24
        searchView.backgroundColor = UIColor(named: "textGray")
        searchView.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                              shadowOffset: CGSize(width: 0, height: 0),
                              shadowRadius: 6.1,
                              shadowOpacity: 0.7)
        
        searchLabel.text = "searchNum".localized()
        searchLabel.textColor = UIColor(named: "textLightGrey")
        searchLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        let searchTapGesture = UITapGestureRecognizer(target: self, action: #selector(searchTapped))
        searchView.addGestureRecognizer(searchTapGesture)
    }
    
    func setupFloatingPanel() {
//        floatingPanel = FloatingPanelController()
//        floatingPanel?.delegate = self
//        floatingPanel?.layout = SearchFloatingPanelLayout()
//        
//        let appearance = SurfaceAppearance()
//        appearance.cornerRadius = 22
//        floatingPanel?.surfaceView.appearance = appearance
//        
//        resultsController.didSelectCallback = { [weak self] controller in
//            self?.hidesBottomBarWhenPushed = true
//            self?.navigationController?.pushViewController(controller, animated: true)
//            self?.hidesBottomBarWhenPushed = false
//        }
//        
//        floatingPanel?.set(contentViewController: resultsController)
//        floatingPanel?.addPanel(toParent: self)
    }
    func setUpCallsIndentTern() {
        callsIndentTurn.titleLabel.text = "turnOnTitle".localized()
        callsIndentTurn.subtitleLabel.text = "turnOnSubtitle".localized()
        callsIndentTurn.layer.cornerRadius = 20
        callsIndentTurn.layer.borderColor = UIColor(.red).cgColor
        callsIndentTurn.layer.borderWidth = 2
        
        callsIndentTurn.turnCallback = {
            CXCallDirectoryManager.sharedInstance.openSettings { error in
                print(error)
            }
        }
    }
}

//MARK: - FloatingPanelControllerDelegate
//extension SearchController: FloatingPanelControllerDelegate {
//    
//}
//
////MARK: - SearchFloatingPanelLayout
//final class SearchFloatingPanelLayout: FloatingPanelLayout {
//    let position: FloatingPanelPosition = .bottom
//    let initialState: FloatingPanelState = .half
//    let anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [
//        .full: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
//        .half: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea),
//        .tip: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea),
//    ]
//}
