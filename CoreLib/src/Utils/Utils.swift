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

// MARK: Method to retrieve data from bundle resource
extension Utils {
    public static func dataForResource(bundleIdentifier: String, resource: String, resourceExtension: String)-> Data {
        // Acquire bundle
        if let url = Utils.getBundle(identifier: bundleIdentifier).url(forResource: resource, withExtension: resourceExtension) {
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

extension Utils {
    public static func mock(mock: String)-> [String: Any] {
        // Acquire bundle
        if let url = Utils.getBundle(identifier: Bundles.coreLibBundleIdentifier).url(forResource: mock, withExtension: "json") {
            if let data: Data = try? Data(contentsOf: url) {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {                    
                    return (json)!
                }
            }
        }
        return [:]
    }
}
