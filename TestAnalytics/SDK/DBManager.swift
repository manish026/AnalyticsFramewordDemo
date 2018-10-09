//
//  DBManager.swift
//  TestAnalytics
//
//  Created by Manish on 07/10/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation
import SQLite

struct DBManager {
    
    var db = try! Connection(FileManager.default.dbPath)
    
    let events = Table("Events")
    let event = Expression<String>("event")

    static var shared: DBManager {
        FileManager.default.copyfileToUserDocumentDirectory(forResource: "Events", ofType: "sqlite")
        return DBManager()
    }
    
    private func createTable() {
        do {
            try db.run(events.create { t in
                t.column(event, primaryKey: true)
            })
        } catch  {
            print("error")
        }
        
    }
    
    func truncate() {
        
        _ = try? db.run(events.delete())
        
    }
    
    func insert(value : [String: Any]) {
//        createTable()
        if let stringEvent = value.toString() {
            let insert = events.insert(event <- stringEvent)
          _ =  try? db.run(insert)
        }
    }
    
    func fetch() -> [[String: Any]] {
//        createTable()
        var arr:[[String: Any]] = []
        for row in try! db.prepare(events) {
            
            if let dict = row[event].toDictionary() {
                arr.append(dict)
            }
        }
       return arr
    }
    
}
