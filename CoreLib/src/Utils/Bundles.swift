//
//  Bundles.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/21.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation

protocol BundleProtocol {
    static var coreLibBundleIdentifier: String { get }
}

public struct Bundles: BundleProtocol {
    public static var coreLibBundleIdentifier: String = "bubbleworks.CoreLib"    
}
