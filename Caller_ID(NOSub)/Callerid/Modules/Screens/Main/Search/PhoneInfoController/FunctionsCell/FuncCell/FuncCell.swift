import UIKit

final class FuncCell: UITableViewCell {
    @IBOutlet private(set) weak var iconImageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setuppbpbpbppbUI()
    }
}

//MARK: - Setup
private extension FuncCell {
    func setuppbpbpbppbUI() {
        titleLabel.textColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        self.selectionStyle = .none
    }
}
