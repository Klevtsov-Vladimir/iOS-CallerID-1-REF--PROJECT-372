import UIKit

final class BlockNumTypeCell: UITableViewCell {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private(set) weak var titleTypeLabel: UILabel!
    @IBOutlet private(set) weak var boxImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setmvmmvmvmvupUI()
    }
}

//MARK: - Setup
private extension BlockNumTypeCell {
    func setmvmmvmvmvupUI() {
        
        selectionStyle = .none
        titleLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        
        titleTypeLabel.textColor = .black
        titleTypeLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
}
