import UIKit

final class OnboardingCell: UICollectionViewCell {
    @IBOutlet private weak var titleLAbel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setup()
    }
}

//MARK: - Open methods
extension OnboardingCell {
    func setTitleText(_ text: String) {
        titleLAbel.text = text
    }
}

//MARK: - Setup
private extension OnboardingCell {
    func setup() {
        titleLAbel.textColor = .black
        titleLAbel.font = .systemFont(ofSize: 18, weight: .medium)
    }
}
