//
//  ViewController.swift
//  TestAnalytics
//
//  Created by Manish on 04/10/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit
import AnalyticsMp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func sendEventClicked(_ sender: Any) {
        
        log(event: Event(name: "button1", value: "hello"))
        
    }
    
    @IBAction func deleteAll(_ sender: UIButton) {
        
        log(event: Event(name: "button2", value: "hello"))
        
    }
    
    
}



