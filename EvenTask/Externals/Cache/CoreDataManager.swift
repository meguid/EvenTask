//
//  CoreDataManager.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class CoreDataManager: CacheProtocol {
    func getObject<T>(_ object: T, key: String) -> T? {
        return object
    }
    
    func saveObject<T>(_ object: T, key: String) {
        
    }
    
    func removeObject(key: String) {
        
    }
}
