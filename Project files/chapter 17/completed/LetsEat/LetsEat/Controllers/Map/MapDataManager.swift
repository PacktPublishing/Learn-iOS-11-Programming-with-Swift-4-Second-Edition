//
//  MapDataManager.swift
//  LetsEat
//
//  Created by Craig Clayton on 11/12/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit
import MapKit

class MapDataManager: DataManager {
    
    fileprivate var items:[RestaurantItem] = []
    
    var annotations:[RestaurantItem] {
        return items
    }

//    func fetch(completion:(_ annotations:[RestaurantItem]) -> ()) {
//        if items.count > 0 { items.removeAll() }
//
//        for data in load(file: "MapLocations") {
//            items.append(RestaurantItem(dict: data))
//        }
//
//        completion(items)
//    }
    
    func fetch(with completion: (_ annotations:[RestaurantItem]) -> ()) {
        let manager = RestaurantDataManager()
        manager.fetch(by: "Chicago") { (items) in
            self.items = items
            completion(items)
        }
    }
    
    func currentRegion(latDelta:CLLocationDegrees, longDelta:CLLocationDegrees) -> MKCoordinateRegion {
        guard let item = items.first else { return MKCoordinateRegion() }
        let span = MKCoordinateSpanMake(latDelta, longDelta)
        
        return MKCoordinateRegion(center: item.coordinate, span: span)
    }
}
