import UIKit

final class MainButton: NibDesignable {
    @IBOutlet private weak var button: UIButton!
    
    var isRedBlock = false
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1).cgColor, UIColor.init(red: 60/255, green: 100/255, blue: 244/255, alpha: 1).cgColor]
        l.startPoint = CGPoint(x: 0, y: 0)
        l.endPoint = CGPoint(x: 1, y: 1)
        l.cornerRadius = 10
        layer.insertSublayer(l, at: 0)
        return l
    }()
    
    private lazy var gradientLayerEnabled: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.init(red: 209/255, green: 213/255, blue: 219/255, alpha: 1).cgColor, UIColor.init(red: 209/255, green: 213/255, blue: 219/255, alpha: 1).cgColor]
        l.startPoint = CGPoint(x: 0, y: 0)
        l.endPoint = CGPoint(x: 1, y: 1)
        l.cornerRadius = 10
        layer.insertSublayer(l, at: 0)
        return l
    }()
    
    private lazy var gradientRedLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.init(red: 194/255, green: 78/255, blue: 78/255, alpha: 1).cgColor, UIColor.init(red: 232/255, green: 115/255, blue: 122/255, alpha: 1).cgColor]
        l.startPoint = CGPoint(x: 1, y: 1)
        l.endPoint = CGPoint(x: 0, y: 0)
        l.cornerRadius = 10
        layer.insertSublayer(l, at: 0)
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.removeFromSuperlayer()
        gradientRedLayer.removeFromSuperlayer()
        gradientLayerEnabled.removeFromSuperlayer()
        if !isRedBlock {
            if button.isEnabled {
                button.layer.addSublayer(gradientLayer)
            } else {
                button.layer.addSublayer(gradientLayerEnabled)
            }
        } else {
            button.layer.addSublayer(gradientRedLayer)
        }
        
        
        button.bringSubviewToFront(button.titleLabel ?? UILabel())
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setusdsdsdsdpUI()
    }
    
    var callback: (()->())?
}

//MARK: - Open methods
extension MainButton {
    func setTitleText(_ text: String) {
        button.setTitle(text.uppercased(), for: .normal)
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
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 19, weight: .medium)
        button.setTitleColor(.white, for: .normal)
    }
}
