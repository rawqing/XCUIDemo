//
//  LoginView.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation
import XCTest

class LoginView : View{
    
    lazy var userInput = app.textFields["accountTextField"]
    lazy var pwdInput = app.secureTextFields["passwordTF"]
    lazy var submit = app.buttons["loginButton"]
    
    lazy var invtFormat_toast = app.staticTexts["invalid_format_user".local]
    lazy var invtUser_toast = app.staticTexts["invalid_user".local]

}

