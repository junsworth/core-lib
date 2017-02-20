//
//  SerializationError.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/19.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation

// MARK: Serialization Error
enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}
