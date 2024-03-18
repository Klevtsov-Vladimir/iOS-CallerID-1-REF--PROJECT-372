import UIKit
import UserNotifications

final class NotificationRequestController: UIViewController {
    @IBOutlet private weak var imageSubtitleLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var laterButton: UIButton!
    @IBOutlet private weak var continueView: MainButton!
    
    var isFromSpam = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }
        bvbvgfgtrteydhdjdjsjdehfhfhfd()
    }
    
    @IBAction func laterAction(_ sender: Any) {
        for i in 0...100 {
            print(i)
        }
        DispatchQueue.main.async {
            if !self.isFromSpam {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    DispatchQueue.main.async {
                        if !self.isFromSpam {
                            let controller = TabBarController(selectedIndexT: 0)
                            self.navigationController?.pushViewController(controller, animated: true)
                        } else {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                if UIApplication.shared.canOpenURL(url) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                }
                            }
                        }
                    }
                }
            } else {
                self.dismiss(animated: true)
            }
        }
    }
}

//MARK: - Setup
private extension NotificationRequestController {
    func bvbvgfgtrteydhdjdjsjdehfhfhfd() {
        for i in 0...100 {
            print(i)
        }
        qwertyuiolkjhgfdsdcfvbnmbvcdertgbvcdrtghbvghnbhjmnhj()
    }
    
    func qwertyuiolkjhgfdsdcfvbnmbvcdertgbvcdrtghbvghnbhjmnhj() {
        imageSubtitleLabel.textColor = .black
        imageSubtitleLabel.text = "notificTitleImag".localized()
        imageSubtitleLabel.font = .systemFont(ofSize: 10, weight: .regular)
        
        titleLabel.text = "notificTitle".localized()
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        subtitleLabel.text = "notificSubtitle".localized()
        subtitleLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        laterButton.setTitle("maybeLater".localized(), for: .normal)
        laterButton.backgroundColor = .clear
        laterButton.setTitleColor(.init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1), for: .normal)
        laterButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        
        continueView.setTitleText("turnOn".localized().uppercased())
        continueView.callback = {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                DispatchQueue.main.async {
                    if !self.isFromSpam {
                        let controller = TabBarController(selectedIndexT: 0)
                        self.navigationController?.pushViewController(controller, animated: true)
                    } else {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                    }
                }
            }
        }
    }
}
