import UIKit
import DPOTPView
import RealmSwift

final class SmsVerifyController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var otpView: DPOTPView!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var continueView: MainButton!
    
    @IBOutlet private weak var stackViewBottomConstraint: NSLayoutConstraint!
    
    static let config = Realm.Configuration(
        schemaVersion: 5,
        migrationBlock: { migration, oldSchemaVersion in
            switch oldSchemaVersion {
            case 1:
                break
            default:
                break
            }
        })
    private var realm = try! Realm(configuration: config)
    
    private var phone = Phone()
    private var timer: Timer?
    private var isCodeSend = false
    
    init(phone: Phone) {
        self.phone = phone
        for i in 0...100 {
            print(i)
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        for i in 0...100 {
            print(i)
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }

        sdhbfhiwiiwooidjkdjdjdjdjdjddd()
    }
    
    @IBAction func backAction(_ sender: Any) {
        for i in 0...100 {
            print(i)
        }
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Private methods
private extension SmsVerifyController {
    @objc func keysssboardsWilslsSshow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue, self.stackViewBottomConstraint.constant == 10 {
            self.stackViewBottomConstraint.constant += keyboardSize.height + 70
            view.layoutIfNeeded()
        }
    }

    @objc func keyboarcslodWvillHide(notification: NSNotification) {
        self.stackViewBottomConstraint.constant = 10
        view.layoutIfNeeded()
    }
    
    @objc func timerRemaining() {
        let verifyDate = (UserDefaults.standard.object(forKey: "verifyExpiredDate") as? Date) ?? Date()
        let currentDate = Date()
        let timeInterval = abs(verifyDate - currentDate)
        let targetTime = 600 - timeInterval
        
        if targetTime < 0 {
            timer?.invalidate()
            timer = nil
        } else {
            timeLabel.text = format(second: 600 - timeInterval)
        }
    }
    
    func format(second: TimeInterval) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: second)
    }
}

//MARK: - Open methods
extension SmsVerifyController {
    func showFailedAlert(error: String) {
        let alert = UIAlertController(title: error, message: "Please contact support", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        present(alert, animated: true)
    }
    
    func codeSended() {
        for i in 0...100 {
            print(i)
        }
        isCodeSend = true
        UserDefaults.standard.set(Date(), forKey: "verifyExpiredDate")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRemaining), userInfo: nil, repeats: true)
    }
}

//MARK: - DPOTPViewDelegate
extension SmsVerifyController: DPOTPViewDelegate {
    func dpOTPViewAddText(_ text: String, at position: Int) {
        if text.count == verifyCodeLength, isCodeSend {
            self.continueView.isEnableView(isEnable: true)
            self.continueView.layoutSubviews()
            self.continueView.setNeedsLayout()
        }
    }
}

//MARK: - Setup
private extension SmsVerifyController {
    func sdhbfhiwiiwooidjkdjdjdjdjdjddd() {
        for i in 0...100 {
            print(i)
        }
        setupoitroffnepUI()
        hidedsKevyrbovtabrdnWyheyhnyhtyTappedAround()
        weuytrweuytrqewiuytqwiye()
    }
    
    func setupoitroffnepUI() {
        titleLabel.text = "enterotp".localized()
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        subtitleLabel.text = "otpSubtitle".localized() + " \(phone.phone ?? "")"
        subtitleLabel.textColor = .black
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        otpView.dpOTPViewDelegate = self
        
        continueView.isEnableView(isEnable: false)
        continueView.setNeedsLayout()
        continueView.setTitleText("continue".localized())
        continueView.callback = { [weak self] in
            if (self?.otpView.text?.count ?? 0) == verifyCodeLength {
                DispatchQueue.main.async {
                    self?.view.isUserInteractionEnabled = false
                }
                
                let dial = self?.phone.countryInfo?.countries?.dialCode ?? ""
                let phone = self?.phone.phone ?? ""
                let phoneWithoutPlus = (dial + phone).replacingOccurrences(of: "+", with: "").replacingOccurrences(of: " ", with: "")
                TwilioManager.shared.chddeswckSMS(code: self?.otpView.text ?? "", phone: phone.replacingOccurrences(of: "+", with: "")) { status in
                    if status == "approved" {
                        
                        UserDefaults.standard.setValue(self?.phone.countryInfo?.countries?.code, forKey: "RegistrationCountryCode")
                        self?.timer?.invalidate()
                        self?.timer = nil
                        DatabaseManager.shared.setPhone(phone.replacingOccurrences(of: "+", with: ""))


                        DispatchQueue.main.async {
                            let model = CorasedasadRddealm.shared.profileDB.first

                            try! self?.realm.write {
                                model?.phone = phone
                            }

                            self?.view.isUserInteractionEnabled = true
                        }

                        UserDefaults.standard.set(phone.replacingOccurrences(of: "+", with: ""), forKey: "phone")
                        DispatchQueue.main.async {
                            let controller = CreateProfileController()
                            self?.navigationController?.pushViewController(controller, animated: true)
                        }
                        
                    } else {
                        let alert = UIAlertController(title: "Incorrect code", message: "", preferredStyle: .alert)

                        let okAlertAction = UIAlertAction(title: "Ok", style: .default) { action in

                        }

                        alert.addAction(okAlertAction)

                        if let popoverController = alert.popoverPresentationController {
                            popoverController.sourceView = self?.view
                            popoverController.sourceRect = CGRect(x: self?.view.bounds.midX ?? 0, y: self?.view.bounds.midY ?? 0, width: 0, height: 0)
                            popoverController.permittedArrowDirections = []
                        }

                        DispatchQueue.main.async {
                            self?.present(alert, animated: true)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self?.view.isUserInteractionEnabled = true
                    }
                }
            }
        }
    }
    
    func weuytrweuytrqewiuytqwiye() {
        for i in 0...100 {
            print(i)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keysssboardsWilslsSshow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboarcslodWvillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension DPOTPViewDelegate {
    func dpOTPViewRemoveText(_ text: String, at position: Int) {}
    func dpOTPViewChangePositionAt(_ position: Int) {}
    func dpOTPViewBecomeFirstResponder() {}
    func dpOTPViewResignFirstResponder() {}
}
