//
//  Codable+Helpers.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        let serialized = (try? JSONSerialization.jsonObject(with: self.encode(), options: .allowFragments)) ?? nil
        return serialized as? [String: Any] ?? [String: Any]()
    }
    
    func encode() -> Data {
        return (try? JSONEncoder().encode(self)) ?? Data()
    }
}

extension Data {
    func decode<T: Codable>(_ object: T) -> T? {
        return (try? JSONDecoder().decode(T.self, from: self))
    }
}
