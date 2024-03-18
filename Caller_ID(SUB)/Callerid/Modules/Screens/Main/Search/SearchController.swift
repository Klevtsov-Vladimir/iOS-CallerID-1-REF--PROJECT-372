import UIKit
import FloatingPanel

final class SearchController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var searchLabel: UILabel!
    
    private var floatingPanel: FloatingPanelController?
    private lazy var resultsController = ResultsPhonesController()
    
    private var realm = CorasedasadRddealm.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(checkBlockTurned), name: NSNotification.Name("checkBlockTurned"), object: nil)

        
//        if Connectivity.isConnectedToInternet {
//             print("Connected")
//         } else {
//             let alert = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .alert)
//             let okAction = UIAlertAction(title: "Ok", style: .default)
//             alert.addAction(okAction)
//             self.present(alert, animated: true)
//        }
        ygdsvbhcbhdschubsdchbdscbuhsdcusuhdchuscusucudhscuhsdcuhsdc()
    }
    
    @objc func checkBlockTurned() {
        DispatchQueue.main.async {
            self.resultsController.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for i in 0...100 {
            print(i)
        }
        subtitleLabel.text = "\(CorasedasadRddealm.shared.profileDB.first?.firstName ?? "") \(CorasedasadRddealm.shared.profileDB.first?.lastName ?? "")"
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
    func ygdsvbhcbhdschubsdchbdscbuhsdcusuhdchuscusucudhscuhsdcuhsdc() {
        setuvjnvjnrjkdekdkededededepUI()
        setupFloatingPanel()
        
        #warning("remove this")
        if realm.profileDB.isEmpty {
            realm.ewqutyrweqgjhfdsjhvdfs(model: ProfileDB())
        }
    }
    
    func setuvjnvjnrjkdekdkededededepUI() {
        self.view.backgroundColor = .init(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
        
        titleLabel.text = "welcome".localized() + ","
        titleLabel.textColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        
        subtitleLabel.text = "\(CorasedasadRddealm.shared.profileDB.first?.firstName ?? "") \(CorasedasadRddealm.shared.profileDB.first?.lastName ?? "")"
        subtitleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        searchView.backgroundColor = .white
        
        searchLabel.text = "searchNum".localized()
        searchLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        searchLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        let searchTapGesture = UITapGestureRecognizer(target: self, action: #selector(searchTapped))
        searchView.addGestureRecognizer(searchTapGesture)
    }
    
    func setupFloatingPanel() {
        floatingPanel = FloatingPanelController()
        floatingPanel?.delegate = self
        floatingPanel?.layout = SearchFloatingPanelLayout()
        
        let appearance = SurfaceAppearance()
        appearance.cornerRadius = 22
        floatingPanel?.surfaceView.appearance = appearance
        
        resultsController.didSelectCallback = { [weak self] controller in
            self?.hidesBottomBarWhenPushed = true
            self?.navigationController?.pushViewController(controller, animated: true)
            self?.hidesBottomBarWhenPushed = false
        }
        
        floatingPanel?.set(contentViewController: resultsController)
        floatingPanel?.addPanel(toParent: self)
    }
}

//MARK: - FloatingPanelControllerDelegate
extension SearchController: FloatingPanelControllerDelegate {
    
}

//MARK: - SearchFloatingPanelLayout
final class SearchFloatingPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .half
    let anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [
        .full: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
        .half: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea),
        .tip: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea),
    ]
}
