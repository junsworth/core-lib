//
//  Utils.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/20.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation

protocol UtilsProtocol {
    static func getBundle(identifier: String)-> Bundle
}

struct Utils: UtilsProtocol {
    public static func getBundle(identifier: String)-> Bundle {
        return Bundle(identifier: identifier)!
    }
}
