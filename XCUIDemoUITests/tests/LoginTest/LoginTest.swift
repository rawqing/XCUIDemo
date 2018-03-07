//
//  LoginTest.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/3/7.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation
import XCTest

class SomeSampleTest: BaseTest {
    private let lv = LoginView()
    private var user: String?
    private var password: String?
    private var esp: String?
   
    override class var defaultTestSuite : XCTestSuite {
        
        let testSuite = XCTestSuite(name: NSStringFromClass(self))
        
        addTestsWithArray(user: "123", pwd: "123333",exp:"invalid_format_user", toTestSuite: testSuite)
        addTestsWithArray(user: "123sdfs@126.com", pwd: "123333",exp:"invalid_user", toTestSuite: testSuite)
        
        return testSuite
    }
    
    private class func addTestsWithArray(user: String, pwd: String, exp: String, toTestSuite testSuite: XCTestSuite) {
        let invocations = self.testInvocations
        for invocation in invocations {
            
            let testCase = SomeSampleTest(invocation: invocation)
            testCase.user = user
            testCase.password = pwd
            testCase.esp = exp
            
            testSuite.addTest(testCase)
        }
    }
    
    func testGeneratedString() {
        
        lv.userInput.replaceText(user!)
        lv.pwdInput.replaceText(password!)
        lv.submit.tap()
        
        XCTAssert(app.staticTexts[(esp?.local)!].waitForExistence(timeout: 5))
    }
    
  
}

