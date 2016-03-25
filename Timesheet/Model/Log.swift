//
//  Log.swift
//  Timesheet
//
//  Created by James Stidard on 24/03/2016.
//  Copyright © 2016 James Stidard. All rights reserved.
//

import Foundation
import Gloss


struct LogPayload: Decodable {
    
    let result: [Log]
    
    init?(json: JSON) {
        guard let result: [Log] = "result" <~~ json
            else { return nil }
        
        self.result = result
    }
}


struct Log: Decodable {
    
    var id:             Int?    = nil
    var project_id:     String? = nil
    var integration_id: Int?    = nil
    var task:           String? = nil
    var start:          NSDate? = nil
    var end:            NSDate? = nil
    var notes:          String? = nil
    
    init() {}
    
    init?(json: JSON) {
        guard let
            id:             Int     = "id" <~~ json,
            project_id:     String  = "project_id" <~~ json,
            integration_id: Int     = "integration_id" <~~ json,
            task:           String? = "task" <~~ json,
            start:          NSDate? = Decoder.decodeUnixTimestamp("created", json: json),
            end:            NSDate? = Decoder.decodeUnixTimestamp("created", json: json),
            notes:          String? = "notes" <~~ json
            else { return nil }
        
        self.id             = id
        self.project_id     = project_id
        self.integration_id = integration_id
        self.task           = task
        self.start          = start
        self.end            = end
        self.notes          = notes
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.id,
            "project_id" ~~> self.project_id,
            "integration_id" ~~> self.integration_id,
            "task" ~~> self.task,
            Encoder.encodeUnixTimestamp("start", value: self.start),
            Encoder.encodeUnixTimestamp("end", value: self.end),
            "notes" ~~> self.notes
        ])
    }
}