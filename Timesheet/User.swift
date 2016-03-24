//
//  User.swift
//  Timesheet
//
//  Created by James Stidard on 24/03/2016.
//  Copyright © 2016 James Stidard. All rights reserved.
//

import Foundation
import Gloss


struct UserPayload: Decodable {
    
    let result: User
    
    init?(json: JSON) {
        guard let result: User = "result" <~~ json
            else { return nil }
        
        self.result = result
    }
}


struct User: Decodable {
    
    let id:           String
    let username:     String
    let settings:     [String: AnyObject]
    let tokens:       [Token]
    let logs:         [Log]
    let integrations: [Integration]
    
    init?(json: JSON) {
        guard let
            id:           String              = "id" <~~ json,
            username:     String              = "username" <~~ json,
            settings:     [String: AnyObject] = "settings" <~~ json,
            tokens:       [Token]             = "tokens" <~~ json,
            logs:         [Log]               = "logs" <~~ json,
            integrations: [Integration]       = "integrations" <~~ json
            else { return nil }
        
        self.id           = id
        self.username     = username
        self.settings     = settings
        self.tokens       = tokens
        self.logs         = logs
        self.integrations = integrations
    }
}