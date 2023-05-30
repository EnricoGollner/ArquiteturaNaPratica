//
//  UserManager.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 30/05/23.
//

import Foundation

protocol UserManagerProtocol {
    // Implementando de formas diferente para mostrar as possibilidades que funcionam do mesmo jeito no Handler:
    func register(email: String, password: String,
                  successHandler: @escaping (UserModel) -> Void,
                  failureHandler: @escaping (Error) -> Void)
    
    func login(email: String, password: String,
                  successHandler: @escaping (UserModel) -> Void,
                  failureHandler: @escaping (Error) -> Void)
}

class UserManager: UserManagerProtocol {
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    // Métodos alternando o jeito também para que possamos conhecer forma diferente de implementar: - antes da Apple ter criado o Result era feito assim:
    func login(email: String, password: String,
               successHandler: @escaping (UserModel) -> Void,
               failureHandler: @escaping (Error) -> Void) {
        business.register(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func register(email: String, password: String,
                  successHandler: @escaping (UserModel) -> Void,
                  failureHandler: @escaping (Error) -> Void) {
        business.register(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
}
