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
        titleLabel.textColor = .lightGray
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }
}
