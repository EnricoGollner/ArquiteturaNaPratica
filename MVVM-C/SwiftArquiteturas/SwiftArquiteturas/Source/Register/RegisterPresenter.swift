//
//  RegisterPresenter.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 04/06/23.
//

import Foundation

protocol RegisterPresenterProtocol: AnyObject {
    func showMessage(title: String, message: String)
    func goHome()
}

class RegisterPresenter {
    private weak var delegate: RegisterPresenterProtocol?
    
    public func delegate(delegate: RegisterPresenterProtocol) {
        self.delegate = delegate
    }
    
    func register(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: userModel.email, password: userModel.email) { [weak self] userModel in
            self?.delegate?.goHome()
        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Error", message: error.localizedDescription)
        }

    }
    
}
