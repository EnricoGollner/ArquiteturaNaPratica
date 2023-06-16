//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 15/06/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RegisterDisplayLogic: AnyObject
{
    func displaySomething(viewModel: Register.Something.ViewModel)
    func displayError(error: Register.Something.ViewError)
}

class RegisterViewController: UIViewController, RegisterDisplayLogic
{
    var interactor: RegisterBusinessLogic?
    var router: (NSObjectProtocol & RegisterRoutingLogic & RegisterDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter()
        let router = RegisterRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func loadView() {
        self.view = registerView
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Register"
        
    }
    
    // MARK: Do something
    
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        
        view.onRegisterTapped = { [weak self] userModel in
            if let self {
                self.registerTapped(userModel: userModel)
            }
        }
        
        return view
    }()
    
    func displaySomething(viewModel: Register.Something.ViewModel)
    {
        router?.routeToHome()
    }
    
    func displayError(error: Register.Something.ViewError) {
        let errorMsg = error.error.localizedDescription
        
        let alert = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func registerTapped(userModel: UserModel) {
        let request = Register.Something.Request(userModel: userModel)
        interactor?.doSomething(request: request)
    }
    
    
}
