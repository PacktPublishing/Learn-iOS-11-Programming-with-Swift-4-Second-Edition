//
//  Device.swift
//  LetsEat
//
//  Created by Craig Clayton on 12/3/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

struct Device {
    
    static var currentDevice: UIDevice {
        struct Singleton {
            static let device = UIDevice.current
        }
        
        return Singleton.device
    }
    
    static var isPhone: Bool {
        return currentDevice.userInterfaceIdiom == .phone
    }
    
    static var isPad: Bool {
        return currentDevice.userInterfaceIdiom == .pad
    }
}

