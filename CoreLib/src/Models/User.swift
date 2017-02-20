//
//  User.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/12.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation

// MARK: Protocol
protocol UserProtocol {
    // MARK: Variables
    var id: Int { get set }
    var firstName: String { get set }
    var lastName: String { get set }
    
    // MARK: Methods
    init()
}

// MARK: Model
public struct User: UserProtocol {
    
    // MARK: Variables to use
    var id: Int
    var firstName: String
    var lastName: String
    
    // MARK: Initialization
    public init() {
        self.id = 0;
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

// MARK: JSON string to model extension
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
        
        self.id = idVal
        self.firstName = firstNameVal
        self.lastName = lastNameVal
    }
}
