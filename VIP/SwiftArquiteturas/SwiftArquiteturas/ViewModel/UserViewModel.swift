//
//  UserViewModel.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 11/06/23.
//

import Foundation

class UserViewModel {
    private let model: UserModel
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()  // Temos um init vazio
    }
    
    public var getEmail: String {
        model.email
    }
    
    public func getUserFromAPI(_ email: String, _ password: String, completion: @escaping (Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
    
    public func setUserOnAPI(_ email: String, _ password: String, completion: @escaping (Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
    
}
