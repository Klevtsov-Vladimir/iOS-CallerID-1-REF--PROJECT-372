import UIKit

final class AboutCell: UITableViewCell {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var rightLabel: UILabel!
    @IBOutlet private(set) weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        rtrteyewyeuudhfhvnvjdjdjddddd()
    }
}

//MARK: - Setup
private extension AboutCell {
    func rtrteyewyeuudhfhvnvjdjdjddddd() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        rightLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        rightLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        self.selectionStyle = .none
    }
}
