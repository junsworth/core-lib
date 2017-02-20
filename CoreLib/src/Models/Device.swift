//
//  Device.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/19.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation

// MARK: Protocol
protocol DeviceProtocol {
    var id: String { get set }
    var name:String { get set }
    init()
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
   
}
