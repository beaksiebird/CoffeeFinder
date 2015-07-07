//
//  SocialData.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/3/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

private let _singleton = SocialData()

class SocialData: NSObject {
    
    class func mainData() -> SocialData {
        
        return _singleton 
    }
    
}
