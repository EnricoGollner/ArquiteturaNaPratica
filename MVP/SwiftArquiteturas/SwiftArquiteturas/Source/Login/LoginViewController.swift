//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 01/06/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    private let presenter: LoginPresenter = LoginPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func openButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        presenter.login(userModel: UserModel(email: email, password: password))
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        presenter.goRegister()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate(delegate: self)
    }
    
}

extension LoginViewController: LoginPresenterDelegate {
    func goHome() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func goRegister() {
        let register = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        register.modalPresentationStyle = .fullScreen
        self.present(register, animated: true)
    }
    
}
