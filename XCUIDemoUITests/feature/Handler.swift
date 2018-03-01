//
//  Handler.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation
import XCTest

class Handler{
    
    /*!
     * 使用方法获取本地化字符串
     */
    class open func local(_ key:String ,bundle: Bundle? = nil) -> String {
        var bl = bundle
        if (bl == nil) {
            bl = Bundle(for:BaseTest.self)
        }
        return NSLocalizedString(key, bundle:bl!,comment: "find \(self) local string .")
    }

    
}

//以 ? 开头
infix operator |> : InfixPrecedence
//以 ? 结尾
infix operator >| : InfixPrecedence
//包含 ?
infix operator <> : InfixPrecedence
//不包含 ?
infix operator >< : InfixPrecedence
///
/// 将属性匹配通过操作符转换成字符串
///
enum UIElementField: String{
    case Identifier = "identifier"
    case Value = "value"
    case Title = "title"
    case Label = "label"
    case ElementType = "elementType"
    case IsEnabled = "isEnabled"
    
    static func == (left: UIElementField, right: String) -> String{
        return "\(left.rawValue) == '\(right)'"
    }
    
    static func |> (left: UIElementField, right: String) -> String{
        return "\(left.rawValue) BEGINSWITH '\(right)'"
    }
    static func >| (left: UIElementField, right: String) -> String{
        return "\(left.rawValue) ENDSWITH '\(right)'"
    }
    static func <> (left: UIElementField, right: String) -> String{
        return "\(left.rawValue) CONTAINS '\(right)'"
    }
}

