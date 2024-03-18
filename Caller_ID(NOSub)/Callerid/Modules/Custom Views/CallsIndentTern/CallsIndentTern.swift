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
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        subtitleLabel.textColor = .black
        subtitleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        rightButton.setTitle("turnOn".localized().uppercased(), for: .normal)
        rightButton.setTitleColor(.init(red: 232/255, green: 115/255, blue: 122/255, alpha: 1), for: .normal)
        rightButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        rightButton.layer.cornerRadius = 8
    }
}
