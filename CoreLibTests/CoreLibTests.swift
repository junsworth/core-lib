//
//  CoreLibTests.swift
//  CoreLibTests
//
//  Created by Jonathan Unsworth on 2017/02/12.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import XCTest

@testable import CoreLib

import SwiftyJSON
import Quick
import Nimble

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
    
    // Confirm user model api
    func testUserModelAPI() {
        self.measure {
            
            // Mock model
            var user: User = UserMockAPI().inject() as! User
            
            // Assert mock model exists
            XCTAssertNotNil(user)
            
            // Assert user id > 0
            XCTAssertTrue(user.id>0)
            //user.firstName = "Hello"
            // Assert user first name
            XCTAssertFalse(user.firstName.isEmpty)
            
            // Expect first name
            expect(user.firstName).to(equal("Jonathan"))
            
            // Assert user last name
            XCTAssertFalse(user.lastName.isEmpty)
            
            // Expect first name
            expect(user.lastName).to(equal("Unsworth"))
            
            let users: [User] = UserMockAPI().injectArray() as! [User]
            
            expect(users.count).to(equal(2))
        }
    }
    
    // Confirm user model api
    func testDeviceModelAPI() {
        self.measure {
            let device: Device = DeviceMockAPI().inject() as! Device
            
            expect(device.getName()).to(equal("Jono's Device"))
        }
    }
    
    // Confirm the User initializer works
    func testUserInitializersSucceed(){
        
        self.measure {
        
            // Mock user
            let mockUser = UserMockAPI().inject() as! User
            
            // Assert mock user exists
            XCTAssertNotNil(mockUser)
            
            // Assert user's id > 0
            XCTAssertTrue(mockUser.id>0)
            
            // Assert user name
            XCTAssertFalse(mockUser.firstName.isEmpty)
            
            let jsonUser = UserMockAPI().inject() as! User
            
            XCTAssertNotNil(jsonUser)
            
            // Assert user's id > 0
            XCTAssertTrue(jsonUser.id>0)
            
            // Assert user name
            XCTAssertFalse(jsonUser.firstName.isEmpty)
            
            let namedUser = User.init(id: 1, firstName: "Jonathan", lastName: "Unsworth")
            XCTAssertNotNil(namedUser)
            
            let unNamedUser = User.init(id:2, firstName: "", lastName: "Unsworth")
            XCTAssertNil(unNamedUser)
            
            XCTAssertFalse(namedUser==unNamedUser)
            
            let mockUsers: [User] = User.users(json: Utils.inject(model: "users", bundleIdentifier: Keyword.coreLibBundleIdentifier), key: "users")
            
            XCTAssertTrue(mockUsers.count>0)
            
            let swiftyUsers: [User] = User.users(json: JSON(data: Utils.dataForResource(bundleIdentifier: Keyword.coreLibBundleIdentifier, withGKResource: "users", withGKExtension: Keyword.jsonFileExt)), key: "users")
            
            XCTAssertTrue(swiftyUsers.count>0)
            
        }
        
    }
    
}
