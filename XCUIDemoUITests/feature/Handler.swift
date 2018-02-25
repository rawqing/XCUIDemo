//
//  Handler.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation

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
