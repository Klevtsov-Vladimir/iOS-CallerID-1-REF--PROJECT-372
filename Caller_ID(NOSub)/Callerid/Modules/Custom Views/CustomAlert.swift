//
//  CustomAlert.swift
//  Callerid
//
//  Created by Владимир Клевцов on 19.3.24..
//

import UIKit

class CustomAlertView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white // Custom text color for title
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white // Custom text color for message
        label.numberOfLines = 0 // Allow multiple lines
        return label
    }()
    
    let actionButton1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue // Custom background color for button
        button.layer.cornerRadius = 5
        return button
    }()
    
    let actionButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red // Custom background color for button
        button.layer.cornerRadius = 5
        return button
    }()
    
    init(title: String?, message: String?, button1Text: String?, button2Text: String?) {
        super.init(frame: .zero)
        
        // Configure the view
        backgroundColor = UIColor.black.withAlphaComponent(0.7) // Custom background color for alert view
        
        // Add subviews
        addSubview(titleLabel)
        addSubview(messageLabel)
        addSubview(actionButton1)
        addSubview(actionButton2)
        
        // Set constraints
        titleLabel.text = title
        messageLabel.text = message
        actionButton1.setTitle(button1Text, for: .normal)
        actionButton2.setTitle(button2Text, for: .normal)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton1.translatesAutoresizingMaskIntoConstraints = false
        actionButton2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            actionButton1.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            actionButton1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            actionButton1.widthAnchor.constraint(equalToConstant: 120),
            actionButton1.heightAnchor.constraint(equalToConstant: 40),
            
            actionButton2.topAnchor.constraint(equalTo: actionButton1.topAnchor),
            actionButton2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            actionButton2.widthAnchor.constraint(equalTo: actionButton1.widthAnchor),
            actionButton2.heightAnchor.constraint(equalTo: actionButton1.heightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

