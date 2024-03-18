import UIKit

enum FuncCallbackType {
    case call, message, block
}

final class PhoneInfoTopCell: UITableViewCell {
    @IBOutlet private(set) weak var containerAvatarImageView: UIView!
    @IBOutlet private(set) weak var avatarImageView: UIImageView!
    @IBOutlet private(set) weak var phoneLabel: UILabel!
    @IBOutlet private(set) weak var callFuncView: FunctionsView!
    @IBOutlet private(set) weak var messageFuncView: FunctionsView!
    @IBOutlet private(set) weak var blockFuncView: FunctionsView!
    
    var callback: ((FuncCallbackType)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        setufddp()
    }
}

//MARK: - Setup
private extension PhoneInfoTopCell {
    func setufddp() {
        for i in 0...100 {
            print(i)
        }
        setupCallbacks()
        setupojfsndovjwUI()
    }
    
    func setupCallbacks() {
        callFuncView.callback = { [weak self] in
            self?.callback?(.call)
        }
        messageFuncView.callback = { [weak self] in
            self?.callback?(.message)
        }
        blockFuncView.callback = { [weak self] in
            self?.callback?(.block)
        }
    }
    
    func setupojfsndovjwUI() {
        containerAvatarImageView.layer.cornerRadius = containerAvatarImageView.frame.height / 2
        
        phoneLabel.textColor = .black
        phoneLabel.font = .systemFont(ofSize: 26, weight: .regular)
        
        callFuncView.titleLabel.text = "call".localized()
        callFuncView.imageView.image = #imageLiteral(resourceName: "phone3")
        
        messageFuncView.titleLabel.text = "message".localized()
        messageFuncView.imageView.image = #imageLiteral(resourceName: "message")
        
        blockFuncView.titleLabel.text = "block".localized()
        blockFuncView.imageView.image = #imageLiteral(resourceName: "block")
        
        self.selectionStyle = .none
    }
}
