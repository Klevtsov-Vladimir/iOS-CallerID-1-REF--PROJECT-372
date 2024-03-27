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
        
        self.backgroundColor = .clear
        setsdsdfupUtvscvsrssI()
    }
}

//MARK: - Setup
extension FindPhoneCell {
    func setsdsdfupUtvscvsrssI() {
        containerAvatarView.layer.cornerRadius = containerAvatarView.frame.height / 2
        containerAvatarView.backgroundColor = UIColor(named: "textLightGrey")
        
        avatarLabel.textColor = .white
        avatarLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Manrope-Medium", size: 16)
        
        subtitleLabel.textColor = UIColor(named: "textLightGrey")
        subtitleLabel.font = UIFont(name: "Manrope-Medium", size: 13)
        
        dateLabel.textColor = UIColor(named: "textLightGrey")
        dateLabel.font = UIFont(name: "Manrope-Medium", size: 13)
        
        self.selectionStyle = .none
        
        arrowImage.tintColor = .gray
    }
}
