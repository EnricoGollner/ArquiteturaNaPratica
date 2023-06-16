//
//  HomeCoordinator.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 11/06/23.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(homeViewController, animated: true)
    }
}
