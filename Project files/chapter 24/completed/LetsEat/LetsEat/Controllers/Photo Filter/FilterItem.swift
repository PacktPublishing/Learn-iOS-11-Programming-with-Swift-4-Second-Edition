//
//  FilterItem.swift
//  LetsEat
//
//  Created by Craig Clayton on 11/27/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

class FilterItem: NSObject {
    
    let filter:String
    let name:String
    
    init(dict:[String:AnyObject]) {
        self.name  = dict["name"] as! String
        self.filter = dict["filter"] as! String
        
        super.init()
    }
}
