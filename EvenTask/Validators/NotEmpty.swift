//
//  NotEmpty.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class NotEmpty: BaseValidator {
    
    var value: Any?
    var key: String

    init(value: Any?, key: String) {
        self.value = value
        self.key = key
    }
    
    func orThrow() throws {
        switch value {
        case 0 as Int:
            throw error()
        case 0.0 as Float:
            throw error()
        case "" as String:
            throw error()
        default: break
        }
    }
    
    func error() -> NSError {
        return NSError(domain: "EmptyException", code: 100,
                       userInfo: [NSLocalizedDescriptionKey: "Please fill in the \(key) value"])
    }
}
