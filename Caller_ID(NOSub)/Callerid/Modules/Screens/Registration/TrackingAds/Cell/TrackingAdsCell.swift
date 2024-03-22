import UIKit

final class TrackingAdsCell: UITableViewCell {
    @IBOutlet private(set) weak var iconImageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setuvvcvcxzpUI()
    }
}

//MARK: - Setup
private extension TrackingAdsCell {
    func setuvvcvcxzpUI() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Manrope-Medium", size: 16)
        self.backgroundColor = .clear
    }
}
