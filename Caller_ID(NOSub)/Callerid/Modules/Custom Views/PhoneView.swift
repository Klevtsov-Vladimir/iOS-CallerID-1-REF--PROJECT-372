import UIKit

final class PhoneView: NibDesignable {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var containerView: UIView!
    @IBOutlet private(set) weak var textField: UITextField!
    //@IBOutlet private(set) weak var countryImageView: UIImageView!
    //@IBOutlet private(set) weak var countryPhoneLabel: UILabel!
    
    var countText: Int?
    
    var maxLength = 16
    
    var callbackCountry: (()->())?
    var textFieldDidChange: ((String)->())?
//    var textFieldTouchCall: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setup()
    }
}

//MARK: - Private methods
private extension PhoneView {
    @objc func viewTapped() {
        callbackCountry?()
    }
    
    @objc func textFieldChange() {
        textFieldDidChange?(textField.text ?? "")
    }
}

//MARK: - Open methods
extension PhoneView {
    func setTitleText(_ text: String) {
        titleLabel.text = text
    }
    
    func setCountryImage(_ image: UIImage?) {
//        if let image = image {
//            countryImageView.image = image
//            countryImageView.isHidden = false
//        } else {
//            countryImageView.isHidden = true
//        }
    }
    
    func setPhoneTitleText(_ text: String) {
//        countryPhoneLabel.text = text
    }
    
    func setPlaceholder(_ text: String) {
        textField.placeholder = text
    }
    
    func isHiddenImage(isHidden: Bool) {
//        countryImageView.isHidden = isHidden
    }
    
    func isHiddenLabel(isHidden: Bool) {
//        countryPhoneLabel.isHidden = isHidden
    }
    
    func isHiddenTextField(isHidden: Bool) {
        textField.isHidden = isHidden
    }
    
    func setTextFieldKeyboardType(type: UIKeyboardType) {
        textField.keyboardType = type
    }
    
    func animateBorder() {
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
}

//MARK: - UITextFieldDelegate
extension PhoneView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
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
    func setup() {
        setupUI()
        setupGestures()
    }
    
    func setupUI() {
        textField.textColor = .black
        textField.borderStyle = .none
        textField.keyboardAppearance = UIKeyboardAppearance.dark
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "Manrope-SemiBold", size: 16)
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        
        titleLabel.textColor = UIColor(named: "textLightGrey")
        titleLabel.font = UIFont(name: "Manrope-Medium", size: 16)
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 24
    }
    
    func setupGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        gesture.cancelsTouchesInView = false
        containerView.addGestureRecognizer(gesture)
        
        textField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
}
