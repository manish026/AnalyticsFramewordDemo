//
//  Event.swift
//  AnalyticsMp
//
//  Created by Manish on 04/10/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation

open class Event  {
    
    var name : String!
    var value : Any!
    
    public init(name: String, value: Any) {
        self.name = name
        self.value = value
    }
    
    public var dictionaryValue: [String : Any] {
        return [name : value!]
    }
    
}
