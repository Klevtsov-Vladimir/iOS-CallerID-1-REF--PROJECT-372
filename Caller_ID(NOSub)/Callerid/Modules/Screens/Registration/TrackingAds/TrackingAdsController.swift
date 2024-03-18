import UIKit
import AppTrackingTransparency
import AdSupport

final class TrackingAdsController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var continueButton: MainButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

//MARK: - UITableViewDelegate
extension TrackingAdsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
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
    }
    
    func sedmldfmldtupUI() {
        titleLabel.text = "trackingAdsTitle".localized()
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        descriptionLabel.text = "trackingAdsDescription".localized()
        descriptionLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        continueButton.setTitleText("choose".localized())
        continueButton.callback = {
           
        }
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TrackingAdsCell", bundle: nil), forCellReuseIdentifier: "TrackingAdsCell")
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
