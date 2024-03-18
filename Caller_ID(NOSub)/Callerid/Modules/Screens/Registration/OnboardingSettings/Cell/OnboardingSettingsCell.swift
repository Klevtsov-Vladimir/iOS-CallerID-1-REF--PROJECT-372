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
        titleLabel.textColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
}
