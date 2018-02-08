//
//  RestaurantAnnotation.swift
//  LetsEat
//
//  Created by Craig Clayton on 11/12/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit
import MapKit

public class RestaurantItem: NSObject, MKAnnotation, Decodable {
    public var name: String?
    public var cuisines:[String] = []
    public var latitude: Double?
    public var longitude:Double?
    public var address:String?
    public var postalCode:String?
    public var state:String?
    public var imageURL:String?
    public var restaurantID:Int?
    
    public override init() {}
    
    public var title: String? {
        return name
    }
    
    public var subtitle: String? {
        if cuisines.isEmpty { return "" }
        else if cuisines.count == 1 { return cuisines.first }
        else { return cuisines.joined(separator: ", ") }
    }
    
    public var coordinate: CLLocationCoordinate2D {
        guard let lat = latitude, let long = longitude else { return CLLocationCoordinate2D() }
        return CLLocationCoordinate2D(latitude: lat, longitude: long )
    }
    
    public enum CodingKeys: String, CodingKey {
        case name
        case cuisines
        case latitude = "lat"
        case longitude = "lng"
        case address
        case postalCode = "postal_code"
        case state
        case imageURL = "image_url"
        case restaurantID = "id"
    }
}
