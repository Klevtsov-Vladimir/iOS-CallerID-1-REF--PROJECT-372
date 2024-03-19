import UIKit

final class OnboardingSettingsCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setuvvcccccpUI()
    }
}

//MARK: - Open methods
extension OnboardingSettingsCell {
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func setTitleText(_ text: String) {
        titleLabel.text = text
    }
}

//MARK: - Setup
extension OnboardingSettingsCell {
    func setuvvcccccpUI() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Manrope-Medium", size: 14)
    }
}
