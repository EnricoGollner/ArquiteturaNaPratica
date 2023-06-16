//
//  LoginWorker.swift
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

class LoginWorker
{
    func loginUser(userModel: UserModel,
                   successHandler: @escaping (UserModel?) -> Void,
                   failureHandler: @escaping (Error?) -> Void) {
        
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: userModel.email, password: userModel.password) { userModel in
            successHandler(userModel)
        } failureHandler: { error in
            failureHandler(error)
        }
    }
}
