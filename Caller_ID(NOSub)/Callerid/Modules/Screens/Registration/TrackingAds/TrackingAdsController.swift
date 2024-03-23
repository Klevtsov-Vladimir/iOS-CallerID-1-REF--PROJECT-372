import UIKit
import AppTrackingTransparency
import AdSupport

final class TrackingAdsController: UIViewController {
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    private let descriptionLabel = UILabel()
    private let continueButton = UIButton()
    private let layerView = UIView()
    private let shopingBagImage = UIImageView()
    
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
        
        cell.iconImageView.image = row.image.withTintColor(.white)
        cell.titleLabel.text = row.title
        cell.selectionStyle = .none
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
        
        titleLabel.text = "trackingAdsTitle".localized()
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Manrope-Bold", size: 20)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        
        descriptionLabel.text = "trackingAdsDescription".localized()
        descriptionLabel.textColor = UIColor(named: "textGray")
        descriptionLabel.font = UIFont(name: "Manrope-Medium", size: 12)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.textAlignment = .center
        
        continueButton.setTitle("choose".localized(), for: .normal)
        continueButton.addTarget(self, action: #selector(pushController), for: .touchUpInside)
        continueButton.layer.cornerRadius = 32
        continueButton.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 20)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.backgroundColor = UIColor(named: "PurpleButton")
        continueButton.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                         shadowOffset: CGSize(width: 0, height: 0),
                         shadowRadius: 6.1,
                         shadowOpacity: 0.7)
        
        shopingBagImage.image = UIImage(named: "shopping-bag")
        shopingBagImage.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                                   shadowOffset: CGSize(width: 0, height: 0),
                                   shadowRadius: 6.1,
                                   shadowOpacity: 0.7)
    }
    @objc func pushController() {
        let controller = NotificationRequestController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func setupTable() {
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TrackingAdsCell", bundle: nil), forCellReuseIdentifier: "TrackingAdsCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    func setUpConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        layerView.translatesAutoresizingMaskIntoConstraints = false
        shopingBagImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(layerView)
        view.addSubview(continueButton)
        view.addSubview(descriptionLabel)
        view.addSubview(titleLabel)
        view.addSubview(shopingBagImage)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            layerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            layerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            layerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            layerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -322),
            
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 64),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54),
            descriptionLabel.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -14),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 51),
            
            titleLabel.topAnchor.constraint(equalTo: layerView.topAnchor, constant: 31),

            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 56),
            
            shopingBagImage.heightAnchor.constraint(equalToConstant: 90),
            shopingBagImage.widthAnchor.constraint(equalToConstant: 90),
            shopingBagImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shopingBagImage.centerYAnchor.constraint(equalTo: layerView.centerYAnchor),
            
            tableView.bottomAnchor.constraint(equalTo: layerView.bottomAnchor, constant: -30),
            tableView.heightAnchor.constraint(equalToConstant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 49),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -49)
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
            case .voice: return #imageLiteral(resourceName: "cart")
            case .bussines: return #imageLiteral(resourceName: "house->")
            }
        }
    }
}
