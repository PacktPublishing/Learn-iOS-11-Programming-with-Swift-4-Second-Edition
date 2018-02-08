//
//  FilterItem+NSItem.swift
//  LetsEat
//
//  Created by Craig Clayton on 1/28/18.
//  Copyright © 2018 Cocoa Academy. All rights reserved.
//

import Foundation
import MobileCoreServices

extension FilterItem: NSItemProviderReading {
    static var readableTypeIdentifiersForItemProvider: [String] {
        return [FilterItem.typeIdentifier]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Self {
        switch typeIdentifier {
            
        case FilterItem.typeIdentifier:
            return try! JSONDecoder().decode(self, from: data)
        default:
            throw ParseError.decodingFailed("Invalid type!")
        }
    }
}

extension FilterItem: NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] {
        return [FilterItem.typeIdentifier, kUTTypeUTF8PlainText as String]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        let data: Data?
        
        switch typeIdentifier {
        case FilterItem.typeIdentifier:
            data = try? JSONEncoder().encode(self)
        case kUTTypeUTF8PlainText as NSString as String:
            data = "\(name), \(filter)".data(using: .utf8)
        default:
            data = nil
        }
        
        completionHandler(data, nil)
        return nil
    }
}
