//
//  Trackable.swift
//  AnalyticsMp
//
//  Created by Manish on 04/10/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation
import Alamofire


public protocol Trackable {
    
    /// Sends event to server
    /// - Parameters : Takes one parameter
    ///     - event : A parameter of type Event model
    func log(event: Event)
    
    
    /// Sends event to server
    /// - Parameters : Takes one parameter
    ///     - event : A parameter of type Dictionary
    func log(event: [String : Any])
}


extension Trackable {
    
    public func log(event: [String : Any]) {
        
        var events = DBManager.shared.fetch()
        events.append(event)
        send(event: events)
        print(events)
        
    }
    
    
    public func log(event: Event) {
        
        log(event: event.dictionaryValue)
        
    }
    
    private func send(event: [[String: Any]]) {
        
        guard let apiKey = AnalyticsMP.shared.apiKey else {
            print("Please set the API key")
            assert(false, "Please set the API key")
            return
        }
        
        Alamofire.request(Constants.url, method: .get, parameters: ["events" : event], headers: ["api_key": apiKey]).responseJSON { (response) in
            
            guard let error = response.error else {
                
                if let json = response.result.value {
                    print("JSON: \(json)")
                }
                
                return
            }
            print(error.localizedDescription)
            DBManager.shared.insert(value: event.last!)
        }
        
    }
    
    
}


