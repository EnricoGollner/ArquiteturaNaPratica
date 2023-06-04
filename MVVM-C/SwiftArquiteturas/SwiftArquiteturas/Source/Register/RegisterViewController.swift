//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 01/06/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    private let presenter: RegisterPresenter = RegisterPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    
    @IBAction func registerTappedButton(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let passwordConfirm = passwordConfirmationTextField.text else { return }
        
        if password == passwordConfirm {
            self.presenter.register(userModel: UserModel(email: email, password: password))
        } else {
            self.showMessage(title: "Error", message: "As senhas não conferem!")
        }
    }
    
    @IBAction func backToLogginTappedButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate(delegate: self)
    }
}


extension RegisterViewController: RegisterPresenterProtocol {
    public func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    public func goHome() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
    
    
}
