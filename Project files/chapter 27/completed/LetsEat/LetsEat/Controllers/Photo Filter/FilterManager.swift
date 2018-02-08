//
//  FilterManager.swift
//  LetsEat
//
//  Created by Craig Clayton on 11/27/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

class FilterManager: DataManager {
    
    func fetch(completionHandler:(_ items:[FilterItem]) -> Swift.Void) {
        var items:[FilterItem] = []
        
        for data in load(file: "FilterData") {
            items.append(FilterItem(dict: data))
        }
        
        completionHandler(items)
    }
}

