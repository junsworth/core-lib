//
//  Keyword.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/21.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation

protocol KeywordProtocol {
    // MARK: Bundle identifier
    static var bundleIdentifier: String { get }
    
    // MARK: Keys for key/value pairs
    static var user: String { get }
    static var users: String { get }
    
    // MARK: Keys for file extensions
    static var jsonFileExt: String { get }
}

public struct Keyword: KeywordProtocol {
    // MARK: Bundle identifier
    public static var bundleIdentifier: String = "bubbleworks.CoreLib"
    
    // MARK: Keys for key/value pairs
    public static var user: String = "user"
    public static var users: String = "users"
    
    // MARK: Keys for file extensions
    public static var jsonFileExt: String = "json"
}
