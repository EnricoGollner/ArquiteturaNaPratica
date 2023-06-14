//
//  LoginCoordinator.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 06/06/23.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        
        loginViewController.onRegisterTapped = {
            let registerCoordinator = RegisterCoordinator(navigationController: self.navigationController)  // Passando UINavigationController que foi passado ao LoginCoordinator, o mesmo Navigation que foi definido como RootViewController no SceneDelegate.
            registerCoordinator.start()
        }
        
        loginViewController.onLoginSuccess = {
            let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
            homeCoordinator.start()
        }
        
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
}
