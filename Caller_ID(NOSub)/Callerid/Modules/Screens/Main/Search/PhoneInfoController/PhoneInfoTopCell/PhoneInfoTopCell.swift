import UIKit

enum FuncCallbackType {
    case call, message, block
}

final class PhoneInfoTopCell: UITableViewCell {
    @IBOutlet private(set) weak var avatarImageView: UIImageView!
    @IBOutlet private(set) weak var phoneLabel: UILabel!
    @IBOutlet private(set) weak var callFuncView: FunctionsView!
    @IBOutlet private(set) weak var messageFuncView: FunctionsView!
    @IBOutlet private(set) weak var blockFuncView: FunctionsView!
    @IBOutlet var countryLabel: UILabel!
    
    var callback: ((FuncCallbackType)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

//MARK: - Setup
private extension PhoneInfoTopCell {
    func setup() {
        setupCallbacks()
        seadsfasdfasfgtupUI()
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
    
    func seadsfasdfasfgtupUI() {
        
        phoneLabel.textColor = .white
        phoneLabel.font = UIFont(name: "Manrope-SemiBold", size: 24)
        
        countryLabel.font = UIFont(name: "Manrope-Medium", size: 14)
        countryLabel.textColor = UIColor(named: "textLightGrey")
        
        callFuncView.imageView.image = #imageLiteral(resourceName: "phone3")
        
        messageFuncView.imageView.image = #imageLiteral(resourceName: "message")
        
        blockFuncView.imageView.image = #imageLiteral(resourceName: "block")
        
        self.selectionStyle = .none
    }
}
