//
//  AlamofireServices.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/02/12.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import Foundation
import Alamofire

public class AlamoreServices {
    
    public static let sharedInstance = AlamoreServices()
    
    public func getURLRequest(url:String) -> String {
        
        var result:String = ""
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request!)  // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                result = "\(JSON)"
            }
        }
        
        return result
        
    }
    
}
