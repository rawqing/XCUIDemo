//
//  LoginTest.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/3/7.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation
import XCTest

class LoginTest: BaseTest {
    private let lv = LoginView()
    private var user: String?
    private var password: String?
    private var expectation: String?
   
    override class var defaultTestSuite : XCTestSuite {
        
        let testSuite = XCTestSuite(name: NSStringFromClass(self))
        
        addParamsTests(user: "123", pwd: "123333",exp:"invalid_format_user", toTestSuite: testSuite)
        addParamsTests(user: "123sdfs@126.com", pwd: "123333",exp:"invalid_user", toTestSuite: testSuite)
        
        return testSuite
    }
    
    private class func addParamsTests(user: String, pwd: String, exp: String, toTestSuite testSuite: XCTestSuite) {
        let invocations = self.testInvocations
        for invocation in invocations {
            
            let testCase = LoginTest(invocation: invocation)
            testCase.user = user
            testCase.password = pwd
            testCase.expectation = exp
            
            testSuite.addTest(testCase)
        }
    }
    
    func testLogin() {
        
        lv.userInput.replaceText(user!)
        lv.pwdInput.replaceText(password!)
        lv.submit.tap()
        
        XCTAssert(lv.toastIsExistent(self.expectation!))
    }
    
  
}

