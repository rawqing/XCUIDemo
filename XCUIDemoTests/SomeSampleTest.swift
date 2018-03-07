//
//  SomeSampleTest.swift
//  XCUIDemoTests
//
//  Created by king on 2018/3/1.
//  Copyright © 2018年 king. All rights reserved.
//

import Foundation

import XCTest

/**
 Contrived test case showing how to work around the fact that NSInvocation is not directly
 accessible to the Swift.
 
 This technique works as of Xcode 7.1 and Xcode 7.2 beta.
 */

class SomeSampleTest: XCTestCase {
    
    // MARK: Private Properties
    // these are mutable because we can't set them in an initializer due to
    // `NSInvocation` not being available in Swift.
    private var array: [String]?
    private var expectedString: String?
    
    // MARK: Object Life Cycle (Swift Does Not Support NSInvocation)
    // This is what we want to do. However, this is commented out because
    // `NSInvocation` is unavailable in Swift.
    //    init(array: [String], expectedString: String, invocation: NSInvocation) {
    //        super.invocation(invocation)
    //
    //        self.array = array
    //        self.expectedString = expectedString
    //    }
    // MARK: Dynamic Test Creation
    override class var defaultTestSuite : XCTestSuite {
        
        let testSuite = XCTestSuite(name: NSStringFromClass(self))
        
        // A new test instance is created for each set of input + each test method
        // For example, there are 5 data sets and 2 test methods. This means
        // there will be 10 test case instances created and executed
        addTestsWithArray(array: [], expectedString: "", toTestSuite: testSuite)
        addTestsWithArray(array: ["Brian"], expectedString: "Brian", toTestSuite: testSuite)
        addTestsWithArray(array: ["Brian", "Coyner"], expectedString: "BrianCoyner", toTestSuite: testSuite)
        addTestsWithArray(array: ["Brian", "Coyner", "Was"], expectedString: "BrianCoynerWas", toTestSuite: testSuite)
        addTestsWithArray(array: ["Brian", "Coyner", "Was", "Here"], expectedString: "BrianCoynerWasHere", toTestSuite: testSuite)
        
        return testSuite
    }
    
    private class func addTestsWithArray(array: [String], expectedString: String, toTestSuite testSuite: XCTestSuite) {
        // Returns an array of NSInvocation, which are not available in Swift, but still seems to work.
        let invocations = self.testInvocations
        for invocation in invocations {
            
            // We can't directly use the NSInvocation type in our source, but it appears
            // that we can pass it on through.
            let testCase = SomeSampleTest(invocation: invocation)
            
            // Normally the "parameterized" values are passed during initialization.
            // This is a "good enough" workaround. You'll see that I simply force unwrap
            // the optional at the callspot.
            testCase.array = array
            testCase.expectedString = expectedString
            
            testSuite.addTest(testCase)
        }
    }
    
    // MARK: Test Methods
    func testGeneratedString() {
        
        // Normally you would be testing some real (class, struct, etc). This example
        // is only showing how to set up "parameters" for test methods
        let actualString = array!.reduce("", +)
        XCTAssertEqual(expectedString, actualString)
    }
    
    func testGeneratedStringDoesSomethingElseFun() {
        // Most "parameterized" tests only have one method.
        // However, supporting multiple parameterized test methods
        // is as easy as implementing a new test method.
        // The `self.testInvocations()` method will pick up
        // all "test" methods, including this one.
    }
}

