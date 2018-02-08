//
//  Shortcut.swift
//  LetsEat
//
//  Created by Craig Clayton on 12/7/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import Foundation

enum Shortcut: String {
    case openMap
    case openLocations
    case openLosAngeles
    case openLasVegas
    
    init?(with identifier: String) {
        guard let shortIdentifier = identifier.components(separatedBy: ".").last else { return nil }
        self.init(rawValue: shortIdentifier)
    }
    
    var type: String {
        guard let identifier = Bundle.main.bundleIdentifier else { return "" }
        return identifier + ".\(self.rawValue)"
    }
}
