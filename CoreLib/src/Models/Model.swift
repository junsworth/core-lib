//
//  Model.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/21.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: Model Protocol
protocol ModelProtocol {
    
    // Mark Initializers
    init()
    
    // Creates model object from SwiftyJSON.JSON struct.
    init(json:JSON) throws

}
