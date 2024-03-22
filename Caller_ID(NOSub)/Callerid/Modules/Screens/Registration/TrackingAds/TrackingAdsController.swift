import UIKit
import AppTrackingTransparency
import AdSupport

final class TrackingAdsController: UIViewController {
//    private let titleLabel = UILabel()
//    private let tableView = UITableView()
//    private let descriptionLabel = UILabel()
//    private let continueButton = MainButton()
    private let layerView = UIView()
//    private let shopingBagImage = UIImageView()
    
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

//MARK: - UITableViewDelegate
extension TrackingAdsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//MARK: - UITableViewDataSource
extension TrackingAdsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Rows.allCases[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrackingAdsCell", for: indexPath) as? TrackingAdsCell else { return UITableViewCell() }
        
        cell.iconImageView.image = row.image
        cell.titleLabel.text = row.title
        
        return cell
    }
}

//MARK: - Setup
private extension TrackingAdsController {
    func setup() {
        sedmldfmldtupUI()
        setupTable()
        setUpConstraint()
    }
    
    func sedmldfmldtupUI() {
        layerView.layer.cornerRadius = 20
        layerView.layer.borderWidth = 2
        layerView.layer.borderColor = UIColor(named: "PurpleButton")?.cgColor
        layerView.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                            shadowOffset: CGSize(width: 0, height: 0),
                            shadowRadius: 6.1,
                            shadowOpacity: 0.7)
        
//        titleLabel.text = "trackingAdsTitle".localized()
//        titleLabel.textColor = .black
//        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
//        
//        descriptionLabel.text = "trackingAdsDescription".localized()
//        descriptionLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
//        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
//        
//        continueButton.setTitleText("choose".localized())
//        continueButton.callback = {
//            let controller = NotificationRequestController()
//            self.navigationController?.pushViewController(controller, animated: true)
        }
//    }
    
    func setupTable() {
//        tableView.isScrollEnabled = false
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: "TrackingAdsCell", bundle: nil), forCellReuseIdentifier: "TrackingAdsCell")
    }
    func setUpConstraint() {
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        continueButton.translatesAutoresizingMaskIntoConstraints = false
        layerView.translatesAutoresizingMaskIntoConstraints = false
//        shopingBagImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(layerView)
        
        NSLayoutConstraint.activate([
            layerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            layerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            layerView.heightAnchor.constraint(equalToConstant: 320),
            layerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -322)
            ])
    }
}

//MARK: - Enums
private extension TrackingAdsController {
    enum Rows: Int, CaseIterable {
        case voice, bussines
        
        var title: String {
            switch self {
            case .voice: return "trackingAdsSub".localized()
            case .bussines: return "trackingAdsSub1".localized()
            }
        }
        
        var image: UIImage {
            switch self {
            case .voice: return #imageLiteral(resourceName: "speakerphone")
            case .bussines: return #imageLiteral(resourceName: "business")
            }
        }
    }
}
