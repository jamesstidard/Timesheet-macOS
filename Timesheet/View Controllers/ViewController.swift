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
    
    let projects: [Project] = []
    let log = Log()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

