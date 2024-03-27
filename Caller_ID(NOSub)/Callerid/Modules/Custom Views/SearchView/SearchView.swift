import UIKit

final class SearchView: NibDesignable {
    @IBOutlet private(set) weak var textField: UITextField!
    @IBOutlet private weak var cancelButton: UIButton!
    
    private(set) var numberLabel: UILabel?
    
    var cancelCallback: (()->())?
    var numberViewCallback: (()->())?
    var textChangedCallback: ((String)->())?
    var clearCallback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 29
        self.layer.masksToBounds = true
        sedsfdsfsdftusdfdsfpUI()
    }
}

//MARK: - Actions
private extension SearchView {
    @IBAction func czxcczxanczxelAction(_ sender: Any) {
        cancelCallback?()
    }
}

//MARK: - Private methods
private extension SearchView {
    @objc func numberViewsdfsdfsdfsdTapped() {
        numberViewCallback?()
    }
    
    @objc func textChjfnvjkfnvjfjvanged() {
        textChangedCallback?(textField.text ?? "")
    }
    
    @objc func cdsfsdlearTapsfsdfsfdsped() {
        textField.text = ""
        clearCallback?()
    }
}

//MARK: - UITextFieldDelegate
extension SearchView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count ?? 0) < 16 {
            return true
        } else {
            if string == "" {
                return true
            } else {
                if textField.keyboardType == .emailAddress {
                    return true
                }
                return false
            }
        }
    }
}

//MARK: - Setup
private extension SearchView {
    func sedsfdsfsdftusdfdsfpUI() {
        let leftView = UIView(frame: CGRect(x: 0, y: 11, width: 35, height: 29))
        leftView.addRightBorderWithPadding(with: .black, andWidth: 1, padding: 10)
        numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 25, height: 29))
        numberLabel?.textColor = .black
        numberLabel?.font = UIFont(name: "Manrope-SemiBold", size: 18)
        numberLabel?.textAlignment = .center
        leftView.addSubview(numberLabel ?? UILabel())
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(numberViewsdfsdfsdfsdTapped))
        leftView.addGestureRecognizer(gesture)
 
        
        textField.delegate = self
        textField.addTarget(self, action: #selector(textChjfnvjkfnvjfjvanged), for: .editingChanged)
        textField.keyboardType = .phonePad
        textField.keyboardAppearance = UIKeyboardAppearance.dark
        textField.font = UIFont(name: "Manrope-Medium", size: 18)
        textField.leftView = leftView
        textField.leftView?.frame = CGRect(x: 0, y: 0, width: 45, height: 29)
        textField.rightViewMode = .whileEditing
        textField.leftViewMode = .always
        textField.borderStyle = .none
        textField.attributedPlaceholder = NSAttributedString(
            string: "searchNum".localized(),
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "Manrope-Medium", size: 18),
                NSAttributedString.Key.foregroundColor: UIColor(named: "textGray")
            ]
        )
        
        cancelButton.setTitle("cancel".localized(), for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
    }
}
