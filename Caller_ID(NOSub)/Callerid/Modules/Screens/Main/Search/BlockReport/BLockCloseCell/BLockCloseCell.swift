
import UIKit

class BLockCloseCell: UITableViewCell {
    
    var callback: (()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectionStyle = .none
    }
    
    @IBAction func closeAction(_ sender: Any) {
        callback?()
    }
    
}
