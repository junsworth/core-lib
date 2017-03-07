//
//  Device.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/19.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: Protocol
protocol DeviceProtocol: ModelProtocol {
    var id: String { get set }
    var name:String { get set }
}

// MARK: Model
struct Device: DeviceProtocol {
    internal var id: String
    internal var name: String
    
    // MARK: Initialization
    public init() {
        self.id = String()
        self.name = String()
    }
    
    // MARK: Initialization
    public init?(id: String, name: String) {
        
        // Initialization should fail if there is no id or name
        if id.isEmpty || name.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.id = id
        self.name = name
    }
    
    public func getName()-> String {
        return self.name
    }
   
}

// MARK: JSON Initializer
extension Device {
    init(json:JSON) {
        self.init(id: json["id"].stringValue, name: json["name"].stringValue)!
    }
}

// MARK: Equatable extension
extension Device: Equatable {
    public static func ==(lhs: Device, rhs: Device)-> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

