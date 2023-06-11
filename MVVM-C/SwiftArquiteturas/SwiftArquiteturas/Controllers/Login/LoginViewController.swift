//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 06/06/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Closures
    var onRegisterTapped: (() -> Void)?
    var onLoginSuccess: (() -> Void)?
    
    // MARK: Properties
    lazy var loginView: LoginView = { [weak self] in
        let view = LoginView(frame: .zero)
        
        view.onRegisterTapped = {
            self?.onRegisterTapped?()  // Se estiver implementado, executa (alternativa ao delegate)
        }
        
        view.onLoginTapped = { [weak self] email, password in
            self?.loginTapped(email, password)
        }
        
        return view
    }()
    
    // MARK: LifeCycle
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    private func loginTapped(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.getUserFromAPI(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onLoginSuccess?()
            case .failure(let error):
                self?.showMessage(title: "Erro", message: error.localizedDescription)
            }
        }
    }
    
    private func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
}
