import UIKit

final class BetterNameTypeView: NibDesignable {
    @IBOutlet private(set) weak var imageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
}

//MARK: - Setup
private extension BetterNameTypeView {
    func setupUI() {
        titleLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
}
