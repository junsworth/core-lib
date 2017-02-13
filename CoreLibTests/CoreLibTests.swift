//
//  CoreLibTests.swift
//  CoreLibTests
//
//  Created by Jonathan Unsworth on 2017/02/12.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import XCTest
@testable import CoreLib

class CoreLibTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Confirm the User initializer works
    func testUserInitializerSucceeds(){
        
        let namedUser = User.init(firstName: "Jonathan", lastName: "Unsworth", photo: nil)
        XCTAssertNotNil(namedUser)
        
        let unNamedUser = User.init(firstName: "", lastName: "Unsworth", photo: nil)
        XCTAssertNil(unNamedUser)
        
    }
    
}
