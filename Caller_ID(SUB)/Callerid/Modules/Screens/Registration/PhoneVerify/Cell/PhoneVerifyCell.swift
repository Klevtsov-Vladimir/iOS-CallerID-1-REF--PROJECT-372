import UIKit

final class PhoneVerifyCell: UITableViewCell {
    @IBOutlet private(set) weak var phoneView: PhoneView!
    
    var callback: (()->())?
    var textFieldDidChange: ((String)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        
        gewrtwwggdeswsw()
    }
}

//MARK: - Setup
private extension PhoneVerifyCell {
    func gewrtwwggdeswsw() {
        for i in 0...100 {
            print(i)
        }
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        phoneView.callbackCountry = { [weak self] in
            self?.callback?()
        }
        
        phoneView.textFieldDidChange = { [weak self] phone in
            self?.textFieldDidChange?(phone)
        }
    }
}
