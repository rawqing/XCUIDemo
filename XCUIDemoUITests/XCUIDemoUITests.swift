//
//  XCUIDemoUITests.swift
//  XCUIDemoUITests
//
//  Created by king on 2018/2/25.
//  Copyright © 2018年 king. All rights reserved.
//

import XCTest

class XCUIDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
       
        continueAfterFailure = false
      
        XCUIApplication().launch()
 }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let lb = Bundle(for: XCUIDemoUITests.self)
        
        print("\n class func localDone : \(Handler.local("done"))\n")
        
        print("\n extension field localDone : \("cancel".local)\n")
        
        print("\n extension func localDone : \("done".local(lb))\n")

    }
    
}
