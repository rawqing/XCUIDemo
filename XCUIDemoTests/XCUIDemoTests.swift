//
//  XCUIDemoTests.swift
//  XCUIDemoTests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import XCTest
@testable import XCUIDemo

class XCUIDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() throws {
        let str = .Value == "123"
        print("\n \(str)")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
enum OperationError : Error {
    case ErrorOne
    case ErrorTwo
    case ErrorThree(String)
}

extension String {
    
    func ltest() throws -> String {
        if self == "hello"{
            throw OperationError.ErrorThree("same string ! ")
        }
        return "hello \(self) "
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
        return "\(l.rawValue) == \(r)"
    }
}
