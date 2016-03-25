//
//  UnixEncoder.swift
//  Timesheet
//
//  Created by James Stidard on 24/03/2016.
//  Copyright © 2016 James Stidard. All rights reserved.
//

import Foundation
import Gloss


extension Encoder {
    
    static func encodeUnixTimestamp(key: String, value: NSDate?) -> JSON? {
        
        if let value = value {
            return [key : value.timeIntervalSince1970]
        }
        
        return nil
    }
    
}