import UIKit

final class SpamProtectCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var identTitleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private(set) weak var updateButton: UIButton!
    
    var callback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    @IBAction func uaapdafjnvfjateActioqdfGGGn(_ sender: Any) {
        callback?()
    }
}

//MARK: - Setup
private extension SpamProtectCell {
    func setup() {
        selectionStyle = .none
        
        subtitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        subtitleLabel.text = "protectSub".localized()
        
        identTitleLabel.text = "protectTitle".localized()
        identTitleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        
        updateButton.layer.cornerRadius = 10
        updateButton.backgroundColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        updateButton.setTitle("protectButTit".localized().uppercased(), for: .normal)
        updateButton.setTitleColor(.white, for: .normal)
        updateButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
    }
}
