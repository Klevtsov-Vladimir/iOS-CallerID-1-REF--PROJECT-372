import UIKit

final class EditGenderCell: UITableViewCell {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak private(set) var placeholderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        
        setfvefvebbbupUbbbbI()
    }
}

//MARK: - Setup
private extension EditGenderCell {
    func setfvefvebbbupUbbbbI() {
        self.selectionStyle = .none
        
        self.titleLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        self.titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        
        placeholderLabel.textColor = .black
        placeholderLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
}
