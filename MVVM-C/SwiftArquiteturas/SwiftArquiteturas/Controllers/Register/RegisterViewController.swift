//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 11/06/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: Closures
    public var onRegisterSuccess: (() -> Void)?
    public var loginTapped: (() -> Void)?
    
    // MARK: Properties
    lazy var registerView: RegisterView = { [weak self] in
        let view = RegisterView(frame: .zero)
        
        view.onRegisterTapped = { [weak self] email, password in
            self?.registerTapped(email, password)
        }
        
        view.onLoginTapped = {
            self?.loginTapped?()
        }
        
        return view
    }()
    
    // MARK: Override
    override func loadView() {
        super.loadView()
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cadastrar"
    }
    
    
    //MARK: Actions
    private func registerTapped(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.setUserOnAPI(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onRegisterSuccess?()
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
