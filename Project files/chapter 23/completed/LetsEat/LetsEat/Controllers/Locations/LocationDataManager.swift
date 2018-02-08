//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by Craig Clayton on 7/18/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import Foundation

class LocationDataManager {
    
    private var locations:[LocationItem] = []
    
    init() {
        fetch()
    }
    
    func fetch() {
        for data in loadData() {
            locations.append(LocationItem(dict: data))
        }
    }
    
    func numberOfItems() -> Int {
        return locations.count
    }
    
    func locationItem(at index:IndexPath) -> LocationItem {
        return locations[index.item]
    }
    
    private func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "Locations", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        
        return items as! [[String : AnyObject]]
    }
    
    func findLocation(by name:String) -> (isFound:Bool, position:Int){
        guard let index = locations.index(where: { $0.city == name }) else { return (isFound:false, position:0) }
        
        return (isFound:true, position:index)
    }
}
