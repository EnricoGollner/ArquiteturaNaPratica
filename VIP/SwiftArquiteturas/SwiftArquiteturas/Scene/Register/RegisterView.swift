//
//  RegisterView.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 15/06/23.
//

import UIKit

class RegisterView: UIView {
    
    //MARK: Closures
    public var onLoginTapped: (() -> Void)?
    public var onRegisterTapped: ((_ userModel: UserModel) -> Void)?
    
    
    //MARK: Properties
    
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
        
        textField.backgroundColor = .lightText
        textField.textColor = .gray
        
        
        textField.setLeftPaddingPoints(15)
        textField.placeholder = "Endereço de e-mail"
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.backgroundColor = .lightText
        textField.textColor = .gray
        
        textField.setLeftPaddingPoints(15)
        textField.placeholder = "Informe a Senha"
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    lazy var passwordConfirmationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirme sua senha"
        
        return label
    }()
    
    lazy var passwordConfirmationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.backgroundColor = .lightText
        textField.textColor = .gray
        
        textField.setLeftPaddingPoints(15)
        textField.placeholder = "Confirme sua Senha"
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .viewBackgroundColor
        
        setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Visual Elements
    private func setVisualElements() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(passwordConfirmationLabel)
        self.addSubview(passwordConfirmationTextField)
        self.addSubview(registerButton)
        self.addSubview(loginButton)
        
        configConstraints()
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
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordConfirmationLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            passwordConfirmationLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordConfirmationLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordConfirmationTextField.topAnchor.constraint(equalTo: passwordConfirmationLabel.bottomAnchor, constant: 10),
            passwordConfirmationTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordConfirmationTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordConfirmationTextField.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: passwordConfirmationTextField.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    //MARK: - Actions
    @objc func registerButtonTapped() {
        guard let email = emailTextField.text,
              let password = self.passwordTextField.text,
              let passwordConfirmation = self.passwordConfirmationTextField.text else { return }
        
        if email.count < 1 {
            // Mensagem avisando que o e-mail está vazio.
            print("E-mail vazio")
        } else if password.count < 1 {
            print("Password vazia")
        } else if password != passwordConfirmation {
            print("As senhas não conferem")
        } else {
            self.onRegisterTapped?(UserModel(email: email, password: password))
        }
    }
    
    
    @objc func loginButtonTapped() {
        self.onLoginTapped?()
    }
}
