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
        navigationController.pushViewController(LoginViewController(), animated: true)
    }
    
    
}
