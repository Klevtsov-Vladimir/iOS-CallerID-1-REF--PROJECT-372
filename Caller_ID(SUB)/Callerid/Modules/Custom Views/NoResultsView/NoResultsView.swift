import UIKit

final class NoResultsView: NibDesignable {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for i in 0...100 {
            print(i)
        }
        
        setugbvcdpUI()
    }
}

//MARK: - Setup
private extension NoResultsView {
    func setugbvcdpUI() {
        
        for i in 0...100 {
            print(i)
        }
        titleLabel.textColor = .lightGray
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }
}
