//
//  newPhoneView.swift
//  Callerid
//
//  Created by Владимир Клевцов on 19.3.24..
//
import UIKit

final class newPhoneView: NibDesignable {
    
    
    private(set) weak var containerView: UIView!
    private(set) weak var textField: UITextField!
    private(set) weak var countryImageView: UIImageView!
    private(set) weak var countryPhoneLabel: UILabel!
    private weak var iconLabel: UIImageView!
    
    var countText: Int?
    
    var maxLength = 16
    
    var callbackCountry: (()->())?
    var textFieldDidChange: ((String)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
}

//MARK: - Private methods
private extension newPhoneView {
    @objc func viewTapped() {
        callbackCountry?()
    }
    
    @objc func textFieldChange() {
        textFieldDidChange?(textField.text ?? "")
    }
}

//MARK: - Open methods
extension newPhoneView {
    
    func setCountryImage(_ image: UIImage?) {
        if let image = image {
            countryImageView.image = image
            countryImageView.isHidden = false
        } else {
            countryImageView.isHidden = true
        }
    }
    
    func setPhoneTitleText(_ text: String) {
        countryPhoneLabel.text = text
    }
    
    func setPlaceholder(_ text: String) {
        textField.placeholder = text
    }
    
    func isHiddenImage(isHidden: Bool) {
        countryImageView.isHidden = isHidden
    }
    
    func isHiddenLabel(isHidden: Bool) {
        countryPhoneLabel.isHidden = isHidden
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
extension newPhoneView: UITextFieldDelegate {
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
private extension newPhoneView {
    func setup() {
        setupUI()
        setupGestures()
    }
    
    func setupUI() {
        textField.textColor = .black
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        
        
        containerView.backgroundColor = .clear
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 10
        
        countryPhoneLabel.textColor = .black
        countryPhoneLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
    private func setupConstaint() {
            // Assuming you have initialized containerView and added it as a subview
            // Assuming all views (countryImageView, textField, countryPhoneLabel, standImageView) have been created and added as subviews to containerView
            
            // Set up constraints to arrange the views
            countryImageView.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            countryPhoneLabel.translatesAutoresizingMaskIntoConstraints = false
            iconLabel.translatesAutoresizingMaskIntoConstraints = false
            
            containerView.addSubview(countryImageView)
            containerView.addSubview(textField)
            containerView.addSubview(countryPhoneLabel)
            containerView.addSubview(iconLabel)
            
            NSLayoutConstraint.activate([
                // Constraints for countryImageView
                countryImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
                countryImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                countryImageView.widthAnchor.constraint(equalToConstant: 24),
                countryImageView.heightAnchor.constraint(equalToConstant: 24),
                
                // Constraints for textField
                textField.topAnchor.constraint(equalTo: containerView.topAnchor),
                textField.leadingAnchor.constraint(equalTo: countryImageView.trailingAnchor, constant: /* specify spacing */),
                textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                textField.heightAnchor.constraint(equalToConstant: /* specify height */),
                
                // Constraints for countryPhoneLabel
                countryPhoneLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: /* specify spacing */),
                countryPhoneLabel.leadingAnchor.constraint(equalTo: countryImageView.trailingAnchor, constant: /* specify spacing */),
                countryPhoneLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                
                // Constraints for standImageView
                iconLabel.topAnchor.constraint(equalTo: countryPhoneLabel.bottomAnchor, constant: /* specify spacing */),
                iconLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                iconLabel.widthAnchor.constraint(equalToConstant: /* specify width */),
                iconLabel.heightAnchor.constraint(equalToConstant: /* specify height */),
                iconLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        }
    
    func setupGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        gesture.cancelsTouchesInView = false
        containerView.addGestureRecognizer(gesture)
        
        textField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
}

