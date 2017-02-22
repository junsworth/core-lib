//
//  MockAPI.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/21.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation

// MARK: MockAPI for models
protocol MockAPI {
    static func inject(model: String)-> [String: Any]
}

