import UIKit

final class CallIdentifierController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var continueView: MainButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupcvvzxqqwUI()
    }
}

//MARK: - Setup
private extension CallIdentifierController {
    func setupcvvzxqqwUI() {
        titleLabel.text = "callIdentTitle".localized()
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        subtitleLabel.text = "callIdentSubtitle".localized()
        subtitleLabel.textColor = .init(red: 115/255, green: 232/255, blue: 161/255, alpha: 1)
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        continueView.setTitleText("continue".localized())
        continueView.callback = {
            let controller = PhoneVerifyController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
