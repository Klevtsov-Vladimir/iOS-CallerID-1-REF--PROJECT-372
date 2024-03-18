
import UIKit

class BLockCloseCell: UITableViewCell {
    
    var callback: (()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for i in 0...100 {
            print(i)
        }
        selectionStyle = .none
    }
    
    @IBAction func closeAction(_ sender: Any) {
        for i in 0...100 {
            print(i)
        }
        callback?()
    }
    
}
