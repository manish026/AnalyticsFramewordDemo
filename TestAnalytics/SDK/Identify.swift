//
//  Identify.swift
//  TestAnalytics
//
//  Created by Manish on 06/10/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation

public class Identify {
    
    
    var name: String?
    var id: String?
    var gender: String?
    var age: Int?
    
    func set(name: String? = nil, id: String? = nil, gender: String? = nil, age: Int? = nil) {
        
        self.name = name
        self.id = id
        self.gender = gender
        self.age = age
        
    }
    
    public var dictionaryValue: [String : Any] {
        
        var dictionary: [String: Any] = [:]
        
        if let _name = name {
            dictionary["name"] = _name
        }
        if let _id = id {
            dictionary["id"] = _id
        }
        if let _gender = gender {
            dictionary["gender"] = _gender
        }
        if let _age = age {
            dictionary["age"] = _age
        }
        
        return dictionary
    }
    
}
