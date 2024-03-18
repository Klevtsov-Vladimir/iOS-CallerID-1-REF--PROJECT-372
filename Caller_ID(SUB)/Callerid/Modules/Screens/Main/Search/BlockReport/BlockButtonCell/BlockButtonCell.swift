import UIKit

final class BlockButtonCell: UITableViewCell {
    @IBOutlet private(set) weak var blockButtonView: MainButton!
    @IBOutlet private weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        tyhnbvgtyhnbvfgfvcdxerfdcxswedsawesdf()
    }
}

//MARK: - Setup
private extension BlockButtonCell {
    func tyhnbvgtyhnbvfgfvcdxerfdcxswedsawesdf() {
        for i in 0...100 {
            print(i)
        }
        selectionStyle = .none
        blockButtonView.setTitleText("block".localized())
        
        let mainText = "blockButtonSubtitle".localized() + " "
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 178/255)]
        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.systemBlue]
        
        let attributedString1 = NSMutableAttributedString(string: mainText, attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: email, attributes: attrs2)

        attributedString1.append(attributedString2)
        
        self.bottomLabel.attributedText = attributedString1
    }
}
