//
//  Spread.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation


// 扩展String属性 , 使用BaseTest类来获取本地化字符串
extension String{
    var local: String{
        let lb = Bundle(for: BaseTest.self)
        return NSLocalizedString(self, bundle: lb ,comment: "find \(self) local string .")
    }
}

// 扩展String方法 , 使用指定的 Bundle 来获取本地字符串
extension String{
    func local( _ bundle: Bundle)-> String{
        return NSLocalizedString(self, bundle: bundle ,comment: "find \(self) local string .")
    }
}

