//
//  LoginView.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 06/06/23.
//

import UIKit

class LoginView: UIView {
    
    //MARK: - Properties
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.backgroundColor = .lightGray
        textField.textColor = .gray
        
        textField.setLeftPaddingPoints(15)
        textField.placeholder = "Endereço de e-mail"
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    
    lazy var senhaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        
        return label
    }()
    
    lazy var senhaTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.backgroundColor = .lightGray
        textField.textColor = .gray
        
        textField.setLeftPaddingPoints(15)
        textField.placeholder = "Informe a Senha"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .systemBlue
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = .systemBlue
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .viewBackgroundColor
        
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Visual Elements
    private func addViews() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(senhaLabel)
        self.addSubview(senhaTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    
    //MARK: - Set Constraints
    private func configConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            senhaLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            senhaLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            senhaLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            senhaTextField.topAnchor.constraint(equalTo: senhaLabel.bottomAnchor, constant: 10),
            senhaTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            senhaTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            senhaTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: senhaTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
            
            
        ])
    }
    
    //MARK: - Actions
    
}
