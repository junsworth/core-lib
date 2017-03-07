//
//  ModelAPI.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/21.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: 
final class ModelAPI {
    // MARK: Model inject methods
    public static func inject(model: String)-> [String: Any] {
        // Acquire bundle
        if let url = Utils.getBundle(identifier: Keyword.coreLibBundleIdentifier).url(forResource: model, withExtension: Keyword.jsonFileExt) {
            if let data: Data = try? Data(contentsOf: url) {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    return json!
                }
            }
        }
        return [:]
    }
}
