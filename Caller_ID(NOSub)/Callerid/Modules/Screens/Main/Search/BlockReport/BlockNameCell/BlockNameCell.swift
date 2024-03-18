import UIKit

final class BlockNameCell: UITableViewCell {
    @IBOutlet private(set) weak var phoneView: PhoneView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.phoneView.titleLabel.textColor = .black
        }
        
        self.selectionStyle = .none
    }
}
