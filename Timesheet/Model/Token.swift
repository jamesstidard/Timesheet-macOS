//
//  Token.swift
//  Timesheet
//
//  Created by James Stidard on 24/03/2016.
//  Copyright © 2016 James Stidard. All rights reserved.
//

import Foundation
import Gloss


struct TokenPayload: Decodable {
    
    let result: [Token]
    
    init?(json: JSON) {
        guard let result: [Token] = "result" <~~ json
            else { return nil }
        
        self.result = result
    }
}


struct Token: Decodable {
    
    let id:      String
    let name:    String
    let created: NSDate
    
    init?(json: JSON) {
        guard
            let id:      String = "id" <~~ json,
            let name:    String = "name" <~~ json,
            let created: NSDate = Decoder.decodeUnixTimestamp("created", json: json)
            else { return nil }
        
        self.id      = id
        self.name    = name
        self.created = created
    }
}