//
//  UserMock.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/21.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct UserMockAPI: MockAPI {
    
    // MARK: Inject model
    func inject() -> ModelProtocol {
        return User.init(json: JSON(data: Utils.dataForResource(bundleIdentifier: Keyword.coreLibBundleIdentifier, withGKResource: "user", withGKExtension: Keyword.jsonFileExt)))
    }
    
    // MARK: Inject model array
    func injectArray() -> [ModelProtocol] {
        
        var users: [User] = []
        
        let json: JSON = JSON(data: Utils.dataForResource(bundleIdentifier: Keyword.coreLibBundleIdentifier, withGKResource: "users", withGKExtension: Keyword.jsonFileExt))
        
        for object in json["users"].arrayValue {
            let user = User.init(json: object)
            users.append(user)
        }
        
        return users;
        
    }
}
