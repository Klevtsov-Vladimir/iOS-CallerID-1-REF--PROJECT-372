import UIKit

final class PrivacyCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        setdfvbvbtteewdcdupUI()
        
    }
}

//MARK: - Setup
private extension PrivacyCell {
    func setdfvbvbtteewdcdupUI() {
        self.selectionStyle = .none
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        
        subtitleLabel.textColor = .init(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }
}
