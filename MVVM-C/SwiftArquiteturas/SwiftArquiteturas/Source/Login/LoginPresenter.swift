//
//  LoginPresenter.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 03/06/23.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func goHome()
    func showMessage(title: String, message: String)
}

class LoginPresenter {
    private weak var delegate: LoginPresenterProtocol?
    
    public func delegate(delegate: LoginPresenterProtocol) {
        self.delegate = delegate
    }
    
    public func login(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: userModel.email,
                      password: userModel.password) { [weak self] model in
            self?.delegate?.goHome()
        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Erro", message: error.localizedDescription)
        }
    }
}
