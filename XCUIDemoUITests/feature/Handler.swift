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

enum UIElementField: String{
    case Identifier = "identifier"
    case Value = "value"
    case Title = "title"
    case Label = "label"
    case ElementType = "elementType"
    case IsEnabled = "isEnabled"
    
    static func == (l: UIElementField, r: String) -> String{
        return l.rawValue + r
    }
}
struct BB{
    var left: UIElementField
    var rigth: String
    
    static func == (l: BB, r: BB) -> String{
        return l.left.rawValue + r.rigth
    }
}
