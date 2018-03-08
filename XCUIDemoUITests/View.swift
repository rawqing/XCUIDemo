//
//  View.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation
import XCTest

let app: XCUIApplication = XCUIApplication(bundleIdentifier:"com.trubuzz.JuCaiDao")
class View{
    
    /*!
     * 根据传入的字符串捕获toast .
     * 字符串使用本地化 (若没有本地化则使用原样字符串)
     */
    func toast(_ text: String) -> XCUIElement{
        return app.staticTexts[text.local]
    }
    
    /*!
     * 等待5秒toast出现
     */
    func toastIsExistent(_ text: String, timeout: TimeInterval=5 ,file:String=#file ,line: Int=#line) -> Bool{
        let toast = app.staticTexts[text.local]
        return toast.waitForExistence(timeout: timeout)
    }
    
}

// 创建一个 app 的单例
//class UIA {
//    static let app: XCUIApplication = XCUIApplication(bundleIdentifier:"com.trubuzz.JuCaiDao1111")
//    private init(){}
//}

