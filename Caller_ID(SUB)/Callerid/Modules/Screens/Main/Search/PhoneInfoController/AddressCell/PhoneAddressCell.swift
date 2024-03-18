import UIKit

final class PhoneAddressCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        setvrknjwkupUI()
    }
}

//MARK: - Setup
private extension PhoneAddressCell {
    func setvrknjwkupUI() {
        for i in 0...100 {
            print(i)
        }
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = .black
        
        subtitleLabel.textColor = .black
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        
        self.selectionStyle = .none
    }
}
