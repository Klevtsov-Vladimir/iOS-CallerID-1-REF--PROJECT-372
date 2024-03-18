import UIKit

final class BetterNameController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var leftBetterView: BetterNameTypeView!
    @IBOutlet private weak var rightBetterView: BetterNameTypeView!
    @IBOutlet private weak var saveButton: MainButton!
    
    private var selectedType = BetterNameSelectedType.bussines
    
    var closeCallback: (()->())?
    var saveCallback: ((String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

//MARK: - Actions
private extension BetterNameController {
    @IBAction func closeAction(_ sender: Any) {
        closeCallback?()
    }
}

//MARK: - Private methods
private extension BetterNameController {
    @objc func tappedLeft() {
        selectedType = .bussines
        setSelectedImage()
    }
    
    @objc func tappedRight() {
        selectedType = .person
        setSelectedImage()
    }
}

//MARK: - UITextFieldDelegate
extension BetterNameController: UITextFieldDelegate {
    
}

//MARK: - Setup
private extension BetterNameController {
    func setup() {
        titleLabel.text = "betterNameTitle".localized()
        titleLabel.textColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        
        textField.textColor = .black
        textField.delegate = self
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        
        setSelectedImage()
        rightBetterView.titleLabel.text = "business".localized()
        rightBetterView.layer.borderColor = UIColor.lightGray.cgColor
        rightBetterView.layer.borderWidth = 1
        rightBetterView.layer.cornerRadius = 10
        
        leftBetterView.titleLabel.text = "person".localized()
        leftBetterView.layer.borderColor = UIColor.lightGray.cgColor
        leftBetterView.layer.borderWidth = 1
        leftBetterView.layer.cornerRadius = 10
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedRight))
        let tapGestureLeft = UITapGestureRecognizer(target: self, action: #selector(tappedLeft))
        rightBetterView.addGestureRecognizer(tapGesture)
        leftBetterView.addGestureRecognizer(tapGestureLeft)
        
        saveButton.setTitleText("save".localized().uppercased())
        saveButton.callback = { [weak self] in
            if (self?.textField.text?.isEmpty ?? false) {
                UIView.animate(withDuration: 0.3, delay: 0) {
                    self?.textField.layer.borderColor = UIColor.red.cgColor
                    self?.textField.layer.borderWidth = 2
                } completion: { _ in
                    UIView.animate(withDuration: 0.3) {
                        self?.textField.layer.borderColor = UIColor.init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1).cgColor
                        self?.textField.layer.borderWidth = 1
                    }
                }
            } else {
                self?.saveCallback?(self?.textField.text ?? "")
            }
        }
    }
    
    func setSelectedImage() {
        if selectedType == .bussines {
            rightBetterView.imageView.image = #imageLiteral(resourceName: "checkBoxUnselected")
            leftBetterView.imageView.image = #imageLiteral(resourceName: "checkBoxSelected")
        } else {
            rightBetterView.imageView.image = #imageLiteral(resourceName: "checkBoxSelected")
            leftBetterView.imageView.image = #imageLiteral(resourceName: "checkBoxUnselected")
        }
    }
}

//MARK: - Enums
enum BetterNameSelectedType {
    case bussines, person
}
