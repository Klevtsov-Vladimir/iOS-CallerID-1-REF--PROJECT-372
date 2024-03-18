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
        let leftView = UIView(frame: CGRect(x: 0, y: 11, width: 76, height: 22))
        leftView.addRightBorder(with: .lightGray, andWidth: 1)
        numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 76, height: 22))
        numberLabel?.textColor = .init(red: 105.0/255, green: 137.0/255, blue: 254.0/255, alpha: 1)
        numberLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        numberLabel?.textAlignment = .center
        leftView.addSubview(numberLabel ?? UILabel())
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(numberViewsdfsdfsdfsdTapped))
        leftView.addGestureRecognizer(gesture)
        
        let gestureRight = UITapGestureRecognizer(target: self, action: #selector(cdsfsdlearTapsfsdfsfdsped))
        let rightView = UIView(frame: CGRect(x: 0, y: 11, width: 76, height: 22))
        rightView.addGestureRecognizer(gestureRight)
        let imageView = UIImageView(frame: CGRect(x: 38, y: 0, width: 22, height: 22))
        imageView.image = #imageLiteral(resourceName: "closeRound")
        rightView.addSubview(imageView)
        
        textField.delegate = self
        textField.addTarget(self, action: #selector(textChjfnvjkfnvjfjvanged), for: .editingChanged)
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.leftView = leftView
        textField.rightView = rightView
        textField.rightViewMode = .whileEditing
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(
            string: "searchNum".localized(),
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                NSAttributedString.Key.foregroundColor: UIColor.init(red: 178.0/255, green: 178.0/255, blue: 178.0/255, alpha: 1)
            ]
        )
        
        cancelButton.setTitle("cancel".localized(), for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
    }
}
