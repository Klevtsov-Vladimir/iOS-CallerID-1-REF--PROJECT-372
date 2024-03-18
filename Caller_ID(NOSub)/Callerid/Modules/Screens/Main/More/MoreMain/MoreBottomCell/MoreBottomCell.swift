import UIKit

final class MoreBottomCell: UITableViewCell {
    @IBOutlet private(set) weak var leftImageView: UIImageView!
    @IBOutlet private(set) weak var rightImageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
}
