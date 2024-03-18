import UIKit

final class FindPhoneCell: UITableViewCell {
    
    @IBOutlet private(set) weak var containerView: UIView!
    
    @IBOutlet private weak var containerAvatarView: UIView!
    @IBOutlet private(set) weak var avatarImageView: UIImageView!
    @IBOutlet private(set) weak var avatarLabel: UILabel!
    @IBOutlet private(set) weak var containerAvatarImageView: UIView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private(set) weak var dateLabel: UILabel!
    
    @IBOutlet private(set) weak var subStackView: UIStackView!
    
    
    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for i in 0...100 {
            print(i)
        }
        
        setudsdsxcxapUI()
    }
}

//MARK: - Setup
extension FindPhoneCell {
    func setudsdsxcxapUI() {
        containerAvatarView.layer.cornerRadius = containerAvatarView.frame.height / 2
        containerAvatarView.backgroundColor = .init(red: 231/255, green: 231/255, blue: 1, alpha: 1)
        
        avatarLabel.textColor = .black
        avatarLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        subtitleLabel.textColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        dateLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        dateLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        self.selectionStyle = .none
    }
}
