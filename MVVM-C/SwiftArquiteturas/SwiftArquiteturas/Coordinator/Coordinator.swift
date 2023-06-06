//
//  Coordinator.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 06/06/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    func start()
    
    init(navigationController: UINavigationController)
}
