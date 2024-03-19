import UIKit

final class CallIdentifierController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var continueView: MainButton!
    @IBOutlet var layerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupcvvzxqqwUI()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addGradient(colors: [UIColor(named: "bg1stColor") ?? .clear, UIColor(named: "bg2ndColor") ?? .clear],
                         startPoint: CGPoint(x: 0.5, y: 0),
                         endPoint: CGPoint(x: 0.5, y: 1))
    }
}

//MARK: - Setup
private extension CallIdentifierController {
    func setupcvvzxqqwUI() {
        titleLabel.text = "callIdentTitle".localized()
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Manrope-Bold", size: 20)
        
        subtitleLabel.text = "callIdentSubtitle".localized()
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont(name: "Manrope-Medium", size: 16)
        
        layerView.layer.cornerRadius = 20
        layerView.layer.borderWidth = 2
        layerView.layer.borderColor = UIColor(named: "layerGreen")?.cgColor
        layerView.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                            shadowOffset: CGSize(width: 0, height: 0),
                            shadowRadius: 6.1,
                            shadowOpacity: 0.7)
        
        continueView.setTitleText("continue".localized())
        continueView.callback = {
            let controller = PhoneVerifyController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
