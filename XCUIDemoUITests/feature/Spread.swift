//
//  Spread.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation
import XCTest



extension String{
    
    /*!
     * 扩展String属性 , 使用BaseTest类来获取本地化字符串
     */
    var local: String{
        let lb = Bundle(for: BaseTest.self)
        return NSLocalizedString(self, bundle: lb ,comment: "find \(self) local string .")
    }
    
    /*!
     * 扩展String方法 , 使用指定的 Bundle 来获取本地字符串
     */
    func local( _ bundle: Bundle)-> String{
        return NSLocalizedString(self, bundle: bundle ,comment: "find \(self) local string .")
    }
}


extension XCUIElement {
    
    /*!
     * 清除内容并输入
     */
    func replaceText(_ text: String) {
        self.tap()
        
        if let stringValue = self.value as? String {
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
            
            self.typeText(deleteString)
        }
        print("nothing to clean !")
        self.typeText(text)
    }
    
    func wait(_ timeout: Double) -> XCUIElement{
        _ = self.waitForExistence(timeout: timeout)
        return self.firstMatch
    }
}

extension XCUIElementQuery {
    /*!
     * 通过既定的匹配字符串来匹配
     */
    func element(matching predicateString: String) -> XCUIElement {
        return self.element(matching: NSPredicate(format: predicateString))
    }
}

/*!
 * 定义一个操作符group
 */
precedencegroup InfixPrecedence{
    associativity: none
}







