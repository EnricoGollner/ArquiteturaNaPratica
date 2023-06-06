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
    
    func start() {
        let viewController = LoginViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
