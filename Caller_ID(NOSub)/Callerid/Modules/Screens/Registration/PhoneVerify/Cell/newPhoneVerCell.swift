


import UIKit

final class NewPhoneVerifyCell: UITableViewCell {
    var newPhoneView: NewPhoneView!
    
    var callback: (() -> Void)?
    var textFieldDidChange: ((String) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
}

//MARK: - Setup
private extension NewPhoneVerifyCell {
    func setup() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        newPhoneView = NewPhoneView()
        contentView.addSubview(newPhoneView)
        
        newPhoneView.callbackCountry = { [weak self] in
            self?.callback?()
        }
        
        newPhoneView.textFieldDidChange = { [weak self] phone in
            self?.textFieldDidChange?(phone)
        }
    }
    
    internal override func layoutSubviews() {
        super.layoutSubviews()
        
        newPhoneView.frame = contentView.bounds
    }
}


