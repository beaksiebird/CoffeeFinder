//
//  StarsData.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/17/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import Foundation

private let defaults = NSUserDefaults.standardUserDefaults()
private let _singleton = StarsData()

class StarsData: NSObject {
    
    class func session() -> StarsData { return _singleton }
    
    var token: String? {
        
        get {
            
            return defaults.objectForKey("TOKEN") as? String
            
        }
        
        set {
            
            defaults.setValue(newValue, forKey: "TOKEN")
            defaults.synchronize()
            
        }
    }

}