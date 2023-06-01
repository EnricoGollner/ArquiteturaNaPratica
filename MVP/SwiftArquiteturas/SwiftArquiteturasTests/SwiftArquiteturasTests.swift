//
//  SwiftArquiteturasTests.swift
//  SwiftArquiteturasTests
//
//  Created by Enrico Sousa Gollner on 30/05/23.
//

import XCTest
@testable import SwiftArquiteturas

final class SwiftArquiteturasTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegister() {
        
        var userModel = UserModel()
        
        let exp = expectation(description: "Check Login is Successful")
        
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: "teste@teste.com", password: "a12345") { userM in
            print(userM)
            userModel = userM
        } failureHandler: { error in
            print(error)
        }
        
        waitForExpectations(timeout: 30) { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(userModel != nil, true)
        }
        
    }
    
}
