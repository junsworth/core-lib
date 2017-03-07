//
//  DeviceMockAPI.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/03/07.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct DeviceMockAPI: MockAPI {
    internal func injectArray() -> [ModelProtocol] {
        return []
    }

    func inject () -> ModelProtocol {
        return Device.init(json: JSON(data: Utils.dataForResource(bundleIdentifier: Keyword.coreLibBundleIdentifier, withGKResource: "device", withGKExtension: Keyword.jsonFileExt)))
    }
}
