//
//  UserDefaults.swift
//
//  Created by Ahmed Meguid on 12/4/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class UserDefaultsManager: CacheProtocol {
    
    func getObject<T>(_ object: T, key: CachingKey) -> T? where T : Decodable, T : Encodable {
        return getData(key: key)?[0].decode(object)
    }
    
    func saveObject<T>(_ object: T, key: CachingKey) where T : Decodable, T : Encodable {
        saveData(object.encode(), key: key)
    }
    
    
    func getData(key: CachingKey) -> [Data]? {
        return UserDefaults.standard.data(forKey: key.rawValue).map({[$0]})
    }
    
    func saveData(_ data: Data?, key: CachingKey) {
        UserDefaults.standard.set(data, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func removeObject(key: CachingKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
}
