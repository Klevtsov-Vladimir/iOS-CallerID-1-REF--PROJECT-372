import UIKit

final class NoResultsView: NibDesignable {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
}

//MARK: - Setup
private extension NoResultsView {
    func setupUI() {
        titleLabel.textColor = UIColor(named: "textLightGrey")
        titleLabel.font = UIFont(name: "Manrope-Medium", size: 16)
    }
}
