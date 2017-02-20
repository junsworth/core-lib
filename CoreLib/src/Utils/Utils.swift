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

extension Utils {
    public static func mock(mock: String)-> [String: Any] {
        // Acquire bundle
        if let url = Utils.getBundle(identifier: "bubbleworks.CoreLib").url(forResource: mock, withExtension: "json") {
            if let data: Data = try? Data(contentsOf: url) {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    return json!
                    }
            }
        }
        return [String(): 0]
    }
}
