import UIKit

final class PhoneView: NibDesignable {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var containerView: UIView!
    @IBOutlet private(set) weak var textField: UITextField!
    @IBOutlet private(set) weak var countryImageView: UIImageView!
    @IBOutlet private(set) weak var countryPhoneLabel: UILabel!
    
    var countText: Int?
    var maxLength = 16
    
    var callbackCountry: (()->())?
    var textFieldDidChange: ((String)->())?
//    var textFieldTouchCall: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        
        rtyryehfduyehduehudwiujxsgxywhuienhdgudjkbhgyhjbvhggyhj()
    }
}

//MARK: - Private methods
private extension PhoneView {
    @objc func viewTapped() {
        for i in 0...100 {
            print(i)
        }
        callbackCountry?()
    }
    
    @objc func textFieldChange() {
        for i in 0...100 {
            print(i)
        }
        textFieldDidChange?(textField.text ?? "")
    }
}

//MARK: - Open methods
extension PhoneView {
    func setTitleText(_ text: String) {
        for i in 0...100 {
            print(i)
        }
        titleLabel.text = text
    }
    
    func setCountryImage(_ image: UIImage?) {
        for i in 0...100 {
            print(i)
        }
        if let image = image {
            countryImageView.image = image
            countryImageView.isHidden = false
        } else {
            countryImageView.isHidden = true
        }
    }
    
    func setPhoneTitleText(_ text: String) {
        for i in 0...100 {
            print(i)
        }
        countryPhoneLabel.text = text
    }
    
    func setPlaceholder(_ text: String) {
        for i in 0...100 {
            print(i)
        }
        textField.placeholder = text
    }
    
    func isHiddenImage(isHidden: Bool) {
        for i in 0...100 {
            print(i)
        }
        countryImageView.isHidden = isHidden
    }
    
    func isHiddenLabel(isHidden: Bool) {
        for i in 0...100 {
            print(i)
        }
        countryPhoneLabel.isHidden = isHidden
    }
    
    func isHiddenTextField(isHidden: Bool) {
        for i in 0...100 {
            print(i)
        }
        textField.isHidden = isHidden
    }
    
    func setTextFieldKeyboardType(type: UIKeyboardType) {
        for i in 0...100 {
            print(i)
        }
        textField.keyboardType = type
    }
    
    func animateBorder() {
        for i in 0...100 {
            print(i)
        }
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.containerView.layer.borderColor = UIColor.red.cgColor
            self.containerView.layer.borderWidth = 2
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.containerView.layer.borderColor = UIColor.lightGray.cgColor
                self.containerView.layer.borderWidth = 1
            }
        }
    }
    
    @objc func textFieldTouch() {
        for i in 0...100 {
            print(i)
        }
        
    }
}

//MARK: - UITextFieldDelegate
extension PhoneView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        for i in 0...100 {
            print(i)
        }
        if (textField.text?.count ?? 0) < maxLength {
            return true
        } else {
            if string == "" {
                return true
            } else {
                if textField.keyboardType == .emailAddress {
                    return true
                }
                if let countText = countText, countText > (textField.text?.count ?? 0) {
                    return true
                }
                return false
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
    }
}

//MARK: - Setup
private extension PhoneView {
    func rtyryehfduyehduehudwiujxsgxywhuienhdgudjkbhgyhjbvhggyhj() {
        for i in 0...100 {
            print(i)
        }
        ssdfetsdfxcxcvvsdfupsdfsddffsUI()
        xserdctfvygbuhnsexrcdftvgybsxedrcftvgbxesdrcftvgybsxdrcfvg()
    }
    
    func ssdfetsdfxcxcvvsdfupsdfsddffsUI() {
        for i in 0...100 {
            print(i)
        }
        textField.textColor = .black
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        
        titleLabel.textColor = .lightGray
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        containerView.backgroundColor = .clear
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 10
        
        countryPhoneLabel.textColor = .black
        countryPhoneLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    func xserdctfvygbuhnsexrcdftvgybsxedrcftvgbxesdrcftvgybsxdrcfvg() {
        for i in 0...100 {
            print(i)
        }
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        gesture.cancelsTouchesInView = false
        containerView.addGestureRecognizer(gesture)
        
        textField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
//        textField.addTarget(self, action: #selector(textFieldTouch), for: .touchUpInside)
    }
}
