//
//  Project.swift
//  Timesheet
//
//  Created by James Stidard on 24/03/2016.
//  Copyright © 2016 James Stidard. All rights reserved.
//

import Foundation
import Gloss


struct ProjectPayload: Decodable {
    
    let result: [Project]
    
    init?(json: JSON) {
        guard let result: [Project] = "result" <~~ json
            else { return nil }
        
        self.result = result
    }
}


struct Project: Decodable {
    
    let id:   String
    let name: String
    let integration_id: Int
    
    init?(json: JSON) {
        guard
            let id:   String = "id" <~~ json,
            let name: String = "name" <~~ json,
            let integration_id: Int = "integration_id" <~~ json
            else { return nil }
        
        self.id   = id
        self.name = name
        self.integration_id = integration_id
    }
}