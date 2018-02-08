//
//  RestaurantPhotoItem.swift
//  LetsEat
//
//  Created by Craig Clayton on 7/29/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

struct RestaurantPhotoItem {
    var photo:UIImage?
    var date:Date?
    var restaurantID:Int?
    var uuid = UUID().uuidString
    
    var photoData:NSData {
        guard let image = photo else { return NSData() }
        return NSData(data: UIImagePNGRepresentation(image)!)
    }
}

extension RestaurantPhotoItem {
    init(data:RestaurantPhoto) {
        self.restaurantID = Int(data.restaurantID)
        if let restaurantPhoto = data.photo { self.photo = UIImage(data: restaurantPhoto, scale:1.0) }
        if let uuid = data.uuid { self.uuid = uuid }
        if let reviewDate = data.date { self.date = reviewDate }
    }
}
