import UIKit

final class DeactiveAccCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var callback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setqwqwqwqerefddupUI()
    }
}

//MARK: - Setup
private extension DeactiveAccCell {
    func setqwqwqwqerefddupUI() {
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 1)
        containerView.layer.borderWidth = 1
        
        titleLabel.text = "privacyAccount".localized().uppercased()
        titleLabel.textColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        gesture.cancelsTouchesInView = true
        containerView.addGestureRecognizer(gesture)
    }
    
    @objc func viewTapped() {
        callback?()
    }
}

