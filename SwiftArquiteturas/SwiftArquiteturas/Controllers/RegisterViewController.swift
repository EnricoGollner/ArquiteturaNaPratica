//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 01/06/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    
    @IBAction func registerTappedButton(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = passwordConfirmationTextField.text else { return }
        
        if password != confirmPassword {
            passwordConfirmationTextField.text = ""
            self.showMessage(title: "Erro", message: "Senhas não conferem!")
            return
        }
        
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: email, password: password) { userModel in
            self.openHomeView()
        } failureHandler: { error in
            self.showMessage(title: "Erro", message: error.localizedDescription)
        }
        
    }
    
    @IBAction func backToLogginTappedButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    private func openHomeView() {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
}
