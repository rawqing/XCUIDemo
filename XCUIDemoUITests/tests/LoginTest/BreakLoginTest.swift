//
//  BreakLoginTest.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation
import XCTest
import Nimble

class BreakLoginTest: BaseTest{
    var lv = LoginView()
    
    func testLogin()   {
        lv.userInput.replaceText("12")
        lv.pwdInput.replaceText("123321")
        
//        let s = lv.invtFormat_toast.waitForExistence(timeout: 5)
        sleep(1)
        let t = app.staticTexts["invalid_format_user".local]
        
        let existsPredicate = NSPredicate(format: "exists == 1")
        expectation(for: existsPredicate, evaluatedWith: t, handler: nil)

//        app.buttons["Load More Games"].tap()
        lv.submit.tap()
 
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssert(t.exists)
    }
    
    func testLogin2()   {
        lv.userInput.replaceText("aaa@126.com")
        lv.pwdInput.replaceText("123321")
        lv.submit.tap()
        
//        let s = lv.invtUser_toast.waitForExistence(timeout: 5)
        let s = app.staticTexts["无效的帐号或密码"].waitForExistence(timeout: 5)
        expect(s) == true
    }
    func testLabel() {
//        let u = app.textFields.element(matching: NSPredicate(format: "identifier == 'accountTF'"))
        
        let z = app.textFields.element(matching: .Identifier == "accountTF")
//        print("\n")
//        print(app.debugDescription)
        z.replaceText("str")
        let z1 = app.staticTexts.element(matching: .Label == "没有账号?")
        expect(z1.exists) == true
    }
}
