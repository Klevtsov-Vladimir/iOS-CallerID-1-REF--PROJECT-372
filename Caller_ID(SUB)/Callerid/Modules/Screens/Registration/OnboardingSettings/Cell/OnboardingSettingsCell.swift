import UIKit

final class OnboardingSettingsCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        setfkmrkmrkfmeupUI()
    }
}

//MARK: - Open methods
extension OnboardingSettingsCell {
    func setImage(_ image: UIImage) {
        for i in 0...100 {
            print(i)
        }
        imageView.image = image
    }
    
    func setTitleText(_ text: String) {
        for i in 0...100 {
            print(i)
        }
        titleLabel.text = text
    }
}

//MARK: - Setup
extension OnboardingSettingsCell {
    func setfkmrkmrkfmeupUI() {
        for i in 0...100 {
            print(i)
        }
        titleLabel.textColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
}
