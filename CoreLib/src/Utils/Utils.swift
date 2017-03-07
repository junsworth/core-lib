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
    // MARK: Retrieve bundle for identifier
    public static func getBundle(identifier: String)-> Bundle {
        return Bundle(identifier: identifier)!
    }
}

// MARK: Method to retrieve data from bundle resources
extension Utils {
    public static func dataForResource(bundleIdentifier: String, withGKResource: String, withGKExtension: String)-> Data {
        // Acquire file url
        if let url = Utils.getBundle(identifier: bundleIdentifier).url(forResource: withGKResource, withExtension: withGKExtension) {
            if let data: Data = try? Data(contentsOf: url) {
                return data
            }
        }
        return Data()
    }
}

// MARK: Method to serialize JSON data to JSON object
extension Utils {
    public static func jsonObject(data: Data)-> [String: Any] {
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            return (json)!
        }
        return [:]
    }
}

// MARK: Parse model data
extension Utils {
    public static func inject(model: String, bundleIdentifier: String)-> [String: Any] {
        // Parse json data
        return Utils.jsonObject(data: Utils.dataForResource(bundleIdentifier: bundleIdentifier, withGKResource: model, withGKExtension: Keyword.jsonFileExt))
    }
}

