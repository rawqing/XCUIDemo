//
//  BaseTest.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation
import XCTest

class BaseTest : XCTestCase {
    let app = UIA.app
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
    
    /*!
     * 等待元素出现
     * 由于使用了 XCTestCase 的实例方法 , 所以只能在这里封装
     */
    func waitForElementToAppear(_ element: XCUIElement,timeout: Double = 5, file: String = #file, line: Int = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
            }
        }
    }
}
