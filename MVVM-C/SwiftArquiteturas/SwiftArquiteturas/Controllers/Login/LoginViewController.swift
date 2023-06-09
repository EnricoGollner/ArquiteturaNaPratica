//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 06/06/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        return view
    }()
    
    // MARK: LifeCycle
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
