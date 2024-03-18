import UIKit

final class MoreProfileCell: UITableViewCell {
    @IBOutlet private(set) weak var containerImageView: UIView!
    @IBOutlet private(set) weak var profileImageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private weak var editButton: UIButton!
    
    var editCallback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        setusvdksdp()
    }
}

//MARK: - Actions
private extension MoreProfileCell {
    @IBAction func editAction(_ sender: Any) {
        editCallback?()
    }
}

//MARK: - Setup
private extension MoreProfileCell {
    func setusvdksdp() {
        setupkenkefnsjnUI()
    }
    
    func setupkenkefnsjnUI() {
        containerImageView.layer.cornerRadius = containerImageView.frame.height / 2
        containerImageView.backgroundColor = .init(red: 245/255, green: 194/255, blue: 111/255, alpha: 1)
        
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.contentMode = .scaleAspectFill
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        subtitleLabel.textColor = .init(red: 97/255, green: 108/255, blue: 118/255, alpha: 1)
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        editButton.setTitle("edit".localized().uppercased(), for: .normal)
        editButton.setTitleColor(.init(red: 85/255, green: 82/255, blue: 217/255, alpha: 1), for: .normal)
        editButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        editButton.layer.cornerRadius = 10
        editButton.backgroundColor = .init(red: 231/255, green: 231/255, blue: 1, alpha: 1)
        
        selectionStyle = .none
    }
}
