//
//  newPhoneView.swift
//  Callerid
//
//  Created by Владимир Клевцов on 19.3.24..
//
import UIKit

final class NewPhoneView: UIView {
    
    private(set) var containerView: UIView!
    private(set) var textField: UITextField!
    private(set) var countryImageView: UIImageView!
    private(set) var countryPhoneLabel: UILabel!
    private var iconLabel: UIImageView!
    
    var countText: Int?
    var maxLength = 16
    var callbackCountry: (() -> Void)?
    var textFieldDidChange: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        setupConstraints()
    }
    
    private func setup() {
        containerView = UIView()
        addSubview(containerView)
        
        countryImageView = UIImageView()
        containerView.addSubview(countryImageView)
        
        textField = UITextField()
        containerView.addSubview(textField)
        textField.delegate = self
        
        countryPhoneLabel = UILabel()
        containerView.addSubview(countryPhoneLabel)
        
        iconLabel = UIImageView()
        containerView.addSubview(iconLabel)
        
        setupUI()
        setupGestures()
    }
    
    private func setupUI() {
        textField.textColor = .black
        textField.borderStyle = .none
        textField.keyboardType = .phonePad
        textField.keyboardAppearance = UIKeyboardAppearance.dark
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.attributedPlaceholder = NSAttributedString(
            string: "(999) 888-77-66",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "PHgray")]
        )
        textField.font = UIFont(name: "Manrope-SemiBold", size: 16)
        
        containerView.backgroundColor = .clear
        containerView.layer.cornerRadius = 32
        containerView.backgroundColor = .white
        
        countryPhoneLabel.textColor = .black
        countryPhoneLabel.font = UIFont(name: "Manrope-SemiBold", size: 16)
    }
    
    private func setupConstraints() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        countryImageView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        countryPhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            countryImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            countryImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            countryImageView.widthAnchor.constraint(equalToConstant: 24),
            countryImageView.heightAnchor.constraint(equalToConstant: 24),
            
            countryPhoneLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            countryPhoneLabel.leadingAnchor.constraint(equalTo: countryImageView.trailingAnchor, constant: 10),
            countryPhoneLabel.heightAnchor.constraint(equalToConstant: 24),
            
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            textField.heightAnchor.constraint(equalToConstant: 20),
            textField.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -40),
            textField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    private func setupGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        gesture.cancelsTouchesInView = false
        containerView.addGestureRecognizer(gesture)
        
        textField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc private func viewTapped() {
        callbackCountry?()
    }
    
    @objc private func textFieldChange() {
        textFieldDidChange?(textField.text ?? "")
    }
}

//MARK: - UITextFieldDelegate
extension NewPhoneView: UITextFieldDelegate {
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

//MARK: - Public Methods
extension NewPhoneView {
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
