//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Craig Clayton on 11/11/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import Foundation

class ExploreDataManager {
    fileprivate var items:[ExploreItem] = [] 
    
    func fetch() {
        for data in loadData() {
            items.append(ExploreItem(dict: data))
        }
    }
    
    fileprivate func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "ExploreData", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        
        return items as! [[String : AnyObject]]
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func explore(at index:IndexPath) -> ExploreItem {
        return items[index.item]
    }
}
