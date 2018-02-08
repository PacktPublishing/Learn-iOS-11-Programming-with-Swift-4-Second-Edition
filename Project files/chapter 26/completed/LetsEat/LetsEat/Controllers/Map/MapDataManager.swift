//
//  MapDataManager.swift
//  LetsEat
//
//  Created by Craig Clayton on 11/12/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit
import MapKit
import LetsEatDataKit

class MapDataManager: DataManager {
    
    fileprivate var items:[RestaurantItem] = []
    
    var annotations:[RestaurantItem] {
        return items
    }
    
    func fetch(with completion: (_ annotations:[RestaurantItem]) -> ()) {
        let manager = RestaurantDataManager()
        manager.fetch(by: "Boston") { (items) in
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
