//
//  User.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/12.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: Protocol
protocol UserProtocol: ModelProtocol {
    // MARK: Variables
    var id: Int { get set }
    var firstName: String { get set }
    var lastName: String { get set }
    
}

// MARK: Model
public struct User: UserProtocol {
    
    // MARK: Variables to use
    var id: Int
    var firstName: String
    var lastName: String
    
    // MARK: Initialization
    public init() {
        self.id = 0
        self.firstName = String()
        self.lastName = String()
    }
    
    // MARK: Initialization
    public init?(id: Int, firstName: String, lastName: String) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if id == 0 || firstName.isEmpty || lastName.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

// MARK: Equatable extension
extension User: Equatable {
    public static func ==(lhs: User, rhs: User)-> Bool {
        return lhs.id == rhs.id && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }    
}

// MARK: JSON Initializer
extension User {
    init(json:JSON) {
        self.init(id: json["id"].intValue, firstName: json["firstName"].stringValue, lastName: json["lastName"].stringValue)!
    }
}

// MARK: JSON Initializer for an array
extension User {
    public static func users(json: JSON, key: String)-> [User] {
        
        var users: [User] = []
        
        for object in json[key].arrayValue {
            let user = User.init(json: object)
            users.append(user)
        }
        
        return users;
    }
}

// MARK: JSON string to model
extension User {
    init?(json: [String: Any]) throws {
        // Extract id
        guard let idVal = json["id"] as? Int else {
                throw SerializationError.missing("id")
        }
        
        // Extract first name
        guard let firstNameVal = json["firstName"] as? String else {
            throw SerializationError.missing("firstName")
        }
        
        // Extract last name
        guard let lastNameVal = json["lastName"] as? String else {
            throw SerializationError.missing("lastName")
        }
        
        self.init(id: idVal, firstName: firstNameVal, lastName: lastNameVal)
    }
}

// MARK: JSON user array to model array
extension User {
    static func users(json: [String: Any], key: String)-> [User]  {
        // Declare & initialize array
        var users: [User] = []
        
        // Loop array of users
        for result in (json[key] as? [[String: Any]])! {
            do {
                if let user = try User.init(json: result) {
                    users.append(user)
                }
            } catch {
                
            }
        }
        return users;
    }
}
