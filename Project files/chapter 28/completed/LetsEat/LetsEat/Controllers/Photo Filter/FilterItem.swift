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
    
    required init(itemProviderData data: Data, typeIdentifier: String) throws {
        if typeIdentifier == FilterItem.typeIdentifier {
            let item = try? JSONDecoder().decode(FilterItem.self, from: data)
            if let i = item {
                self.name = i.name
                self.filter = i.filter
                return
            } }
        throw ParseError.decodingFailed("Invalid type!")
    }
}
