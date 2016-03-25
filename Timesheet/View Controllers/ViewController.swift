//
//  ViewController.swift
//  Timesheet
//
//  Created by James Stidard on 09/03/2016.
//  Copyright © 2016 James Stidard. All rights reserved.
//

import Cocoa
import ReactiveCocoa

class ViewController: NSViewController {
    
    static let BaseUrl = "https://zoho-timesheet-dev.herokuapp.com/v1/resources"
    
    
    @IBOutlet weak var fuzzyInputTokenField: NSTokenField!
    
    var projects: [Project] = []
    let log = Log()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fuzzyInputTokenField
            .rac_textSignal()
            .toSignalProducer()
            .map {entry in entry as! String}
            .flatMap(.Latest) {ViewController.requestProjects($0, limit: 10)}
            .map(ViewController.makeProjects)
            .observeOn(UIScheduler())
            .startWithNext { projects in
                self.projects = projects
            }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    static func requestProjects(query: String, limit: Int) -> ReactiveCocoa.SignalProducer<(NSData, NSURLResponse), NSError> {
        let url     = NSURL(string: "\(self.BaseUrl)/projects?query=\(query)&limit=\(limit)")!
        let request = NSMutableURLRequest(URL: url)
        request.setValue(TokenID, forHTTPHeaderField: "token-id")
        request.setValue(TokenSecret, forHTTPHeaderField: "token-secret")
        
        return NSURLSession.sharedSession().rac_dataWithRequest(request)
    }
    
    static func makeProjects(data: NSData, _: NSURLResponse) -> [Project] {
        guard let
            json    = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as! [String: AnyObject],
            payload = ProjectPayload(json: json)
        else {
            return []
        }
        
        return payload.result
    }
}

