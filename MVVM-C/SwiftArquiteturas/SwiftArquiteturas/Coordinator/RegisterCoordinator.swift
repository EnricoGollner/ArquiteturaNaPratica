//
//  RegisterCoordinator.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 11/06/23.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    public var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let registerViewController = RegisterViewController()
        
        registerViewController.loginTapped = {
            self.navigationController.popToRootViewController(animated: true)
        }
        
        registerViewController.onRegisterSuccess = {
            let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
            homeCoordinator.start()
            print(#function)
        }
        
        self.navigationController.pushViewController(registerViewController, animated: true)
    }
    
    
}
