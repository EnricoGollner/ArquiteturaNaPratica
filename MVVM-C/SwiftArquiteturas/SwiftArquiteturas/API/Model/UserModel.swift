//
//  UserModel.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 30/05/23.
//

import Foundation

struct UserModel: Codable {
    // dessa forma, podemos pegar os valores, porém não podemos setá-los a não ser que por um de seus inicializadores (mais seguro)
    
    var email: String
    let password: String
    
    init() {  // evitamos preocupação com ficarem nil
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
