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
        case "" as String:
            throw ValidationError.emptyValue(key: key)
        case nil:
            throw ValidationError.emptyValue(key: key)
        default: break
        }
    }
}
