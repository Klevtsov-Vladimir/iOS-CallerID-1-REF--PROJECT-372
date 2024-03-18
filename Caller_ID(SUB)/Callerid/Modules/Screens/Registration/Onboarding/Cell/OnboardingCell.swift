import UIKit

final class OnboardingCell: UICollectionViewCell {
    @IBOutlet private weak var titleLAbel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
       
        sdhfbisdfsdfsdfsdfisd()
    }
}

//MARK: - Open methods
extension OnboardingCell {
    func fgdjifjnfsdnfsdfsdfsd(_ text: String) {
        for i in 0...100 {
            print(i)
        }
        titleLAbel.text = text
    }
}

//MARK: - Setup
private extension OnboardingCell {
    func sdhfbisdfsdfsdfsdfisd() {
        for i in 0...100 {
            print(i)
        }
        titleLAbel.textColor = .black
        titleLAbel.font = .systemFont(ofSize: 18, weight: .medium)
    }
}
