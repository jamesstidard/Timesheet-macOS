//
//  Integration.swift
//  Timesheet
//
//  Created by James Stidard on 24/03/2016.
//  Copyright © 2016 James Stidard. All rights reserved.
//

import Foundation
import Gloss


struct IntegrationPayload: Decodable {
    
    let result: [Integration]
    
    init?(json: JSON) {
        guard let result: [Integration] = "result" <~~ json
            else { return nil }
        
        self.result = result
    }
}


struct Integration: Decodable {
    
    let id:    Int?
    let name:  String
    let token: String?
    
    init?(json: JSON) {
        guard
            let id: Int?       = "id" <~~ json,
            let name: String   = "name" <~~ json,
            let token: String? = "token" <~~ json
            else { return nil }
        
        self.id    = id
        self.name  = name
        self.token = token
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.id,
            "name" ~~> self.name,
            "token" ~~> self.token
        ])
    }
}