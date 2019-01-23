//
//  EmptyValueError.swift
//  EvenTask
//
//  Created by Ahmed Meguid on 1/23/19.
//  Copyright © 2019 Ahmed Meguid. All rights reserved.
//

import Foundation

class EmptyValueError: Error, LocalizedError {
    
    var key: String
    
    init(key: String) {
        self.key = key
    }
    
    public var errorDescription: String? {
        return "Please fill in the \(key) value"
    }
}
