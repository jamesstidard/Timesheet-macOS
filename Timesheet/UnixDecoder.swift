//
//  UnixDecoder.swift
//  Timesheet
//
//  Created by James Stidard on 24/03/2016.
//  Copyright © 2016 James Stidard. All rights reserved.
//

import Foundation
import Gloss


extension Decoder {
    
    static func decodeUnixTimestamp(key: String, json: JSON) -> NSDate? {
        
        if let timestamp = json.valueForKeyPath(key) as? NSTimeInterval {
            return NSDate(timeIntervalSince1970: timestamp)
        }
        
        return nil
    }
    
}