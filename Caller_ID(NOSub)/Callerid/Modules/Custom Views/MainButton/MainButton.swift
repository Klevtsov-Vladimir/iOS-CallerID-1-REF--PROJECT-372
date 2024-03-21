import UIKit

final class MainButton: NibDesignable {
    @IBOutlet weak var button: UIButton!
    
    var isRedBlock = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setusdsdsdsdpUI()
    }
    
    var callback: (()->())?
}

//MARK: - Open methods
extension MainButton {
    func setTitleText(_ text: String) {
        button.setTitle(text, for: .normal)
    }
    
    func isEnableView(isEnable: Bool) {
        self.button.isEnabled = isEnable
    }
}

//MARK: - Actions
private extension MainButton {
    @IBAction func buttonAction(_ sender: Any) {
        callback?()
    }
}

//MARK: - Setup
private extension MainButton {
    func setusdsdsdsdpUI() {
        button.layer.cornerRadius = 32
        button.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "PurpleButton")
        button.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                         shadowOffset: CGSize(width: 0, height: 0),
                         shadowRadius: 6.1,
                         shadowOpacity: 0.7)
    }
}
