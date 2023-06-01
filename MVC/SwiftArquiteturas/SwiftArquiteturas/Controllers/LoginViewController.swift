//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 01/06/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func openButtonTapped(_ sender: Any) {
        let manager = UserManager(business: UserBusiness())
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        manager.login(email: email, password: password) { userModel in
            self.openHomeView()
        } failureHandler: { error in
            self.showMessage(title: "Error", message: error.localizedDescription)
        }

    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let registerView = self.storyboard?.instantiateViewController(withIdentifier: "registerViewController") as! RegisterViewController
        registerView.modalPresentationStyle = .fullScreen
        self.present(registerView, animated: true)
    }
    
    func showMessage(title: String, message: String) {
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
