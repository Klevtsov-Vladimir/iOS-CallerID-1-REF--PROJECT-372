import UIKit

final class CallsIndentTern: NibDesignable {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private weak var rightButton: UIButton!
    
    var turnCallback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
}

//MARK: - Actions
private extension CallsIndentTern {
    @IBAction func rightButtonAction(_ sender: Any) {
        turnCallback?()
    }
}

//MARK: - Setup
private extension CallsIndentTern {
    func setup() {
        setxcvbhgfhkolyhtgrreewsdupUI()
    }
    
    func setxcvbhgfhkolyhtgrreewsdupUI() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "MontserratRoman-ExtraBold", size: 14)
        
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont(name: "Manrope-Medium", size: 14)
        
        rightButton.setTitle("turnOn".localized(), for: .normal)
        rightButton.titleLabel?.font = UIFont(name: "MontserratRoman-ExtraBold", size: 16)
        rightButton.layer.cornerRadius = 24
        rightButton.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                              shadowOffset: CGSize(width: 0, height: 0),
                              shadowRadius: 6.1,
                              shadowOpacity: 0.7)
    }
}
