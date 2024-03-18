import UIKit

final class ViewedProfileCell: UITableViewCell {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
                subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
                subtitleLabel.textColor = .lightGray
        
        
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        avatarImage.backgroundColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
    }
}
