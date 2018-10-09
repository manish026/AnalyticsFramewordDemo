//
//  AnalyticsMP.swift
//  AnalyticsMp
//
//  Created by Manish on 04/10/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation
import UIKit

class AnalyticsMP: Trackable {
    
    /// Returns a singleton object of AnalyticsMP
    static let shared = AnalyticsMP()
    
    // init is private so that it is not initialized by developers
//    private override init() {    }
    
    
    var apiKey: String!
    
    var userId: String!
    
    
    
}


