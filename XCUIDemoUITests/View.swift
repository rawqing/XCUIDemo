//
//  View.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation
import XCTest

class View{
    let app = UIA.app
}

// 创建一个 app 的单例
class UIA {
    static let app: XCUIApplication = XCUIApplication(bundleIdentifier:"com.trubuzz.JuCaiDao1111")
    private init(){}
}
