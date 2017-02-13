//
//  User.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/12.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation

public class User {
    
    // MARK: properties
    internal var firstName: String
    internal var lastName: String
    internal var photo: UIImage?
    
    // MARK: Initialization
    public init?(firstName: String, lastName: String, photo: UIImage?) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if firstName.isEmpty || lastName.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.firstName = firstName
        self.lastName = lastName
        self.photo = photo
    }
    
    // MARK: Getters
    public func getFirstName() -> String {
        return self.firstName;
    }
    
    public func getLastName() -> String {
        return self.lastName;
    }
    
    public func getPhoto() -> UIImage {
        return self.photo!;
    }
    
}
