import UIKit
import UserNotifications

final class NotificationRequestController: UIViewController {
   private let imageSubtitleLabel = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let laterButton = UIButton()
    private let continueView = UIButton()
    private let layerView = UIView()
    
    var isFromSpam = false
    
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
    
    @objc func laterAction() {
        DispatchQueue.main.async {
            if !self.isFromSpam {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    DispatchQueue.main.async {
                        if !self.isFromSpam {
                            let controller = TabBarController()
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
    @objc func continueViewAction() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            DispatchQueue.main.async {
                if !self.isFromSpam {
                    let controller = TabBarController()
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

//MARK: - Setup
private extension NotificationRequestController {
    func setup() {
        sdcsdcsdcsdcdscsetupUI()
        setUpConstraint()
    }
    
    func sdcsdcsdcsdcdscsetupUI() {
        layerView.layer.cornerRadius = 20
        layerView.layer.borderWidth = 2
        layerView.layer.borderColor = UIColor(named: "PurpleButton")?.cgColor
        layerView.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                            shadowOffset: CGSize(width: 0, height: 0),
                            shadowRadius: 6.1,
                            shadowOpacity: 0.7)
        
        imageSubtitleLabel.image = UIImage(named: "phoneImage")
        imageSubtitleLabel.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                                   shadowOffset: CGSize(width: 0, height: 0),
                                   shadowRadius: 6.1,
                                   shadowOpacity: 0.7)
        
        titleLabel.text = "notificTitle".localized()
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Manrope-Bold", size: 20)
        titleLabel.numberOfLines = 2
        
        subtitleLabel.text = "notificSubtitle".localized()
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont(name: "Manrope-Medium", size: 16)
        subtitleLabel.numberOfLines = 3
        subtitleLabel.textAlignment = .center
        
        laterButton.setTitle("maybeLater".localized(), for: .normal)
        laterButton.backgroundColor = .clear
        laterButton.setTitleColor(UIColor(named: "textGray"), for: .normal)
        laterButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 16)
        laterButton.addTarget(self, action: #selector(laterAction), for: .touchUpInside)
        
        continueView.setTitle("turnOn".localized(), for: .normal)
        continueView.addTarget(self, action: #selector(continueViewAction), for: .touchUpInside)
        continueView.layer.cornerRadius = 32
        continueView.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 20)
        continueView.setTitleColor(.white, for: .normal)
        continueView.backgroundColor = UIColor(named: "PurpleButton")
        continueView.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                         shadowOffset: CGSize(width: 0, height: 0),
                         shadowRadius: 6.1,
                         shadowOpacity: 0.7)
    }
    func setUpConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        laterButton.translatesAutoresizingMaskIntoConstraints = false
        continueView.translatesAutoresizingMaskIntoConstraints = false
        layerView.translatesAutoresizingMaskIntoConstraints = false
        imageSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(layerView)
        view.addSubview(continueView)
        view.addSubview(laterButton)
        view.addSubview(titleLabel)
        view.addSubview(imageSubtitleLabel)
        view.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            layerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            layerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            layerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 204),
            layerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -322),
            
            continueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            continueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueView.heightAnchor.constraint(equalToConstant: 64),
            
            laterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            laterButton.topAnchor.constraint(equalTo: continueView.bottomAnchor, constant: 16),
            laterButton.heightAnchor.constraint(equalToConstant: 22),
            
            titleLabel.topAnchor.constraint(equalTo: layerView.topAnchor, constant: 31),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 56),
            
            imageSubtitleLabel.heightAnchor.constraint(equalToConstant: 90),
            imageSubtitleLabel.widthAnchor.constraint(equalToConstant: 90),
            imageSubtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageSubtitleLabel.centerYAnchor.constraint(equalTo: layerView.centerYAnchor),
            
            subtitleLabel.bottomAnchor.constraint(equalTo: layerView.bottomAnchor, constant: -30),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 100),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 49),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -49)
            ])
    }
}
