//
//  NotFoundError.swift
//  EvenTask
//
//  Created by Ahmed Meguid on 1/23/19.
//  Copyright © 2019 Ahmed Meguid. All rights reserved.
//

import Foundation

class NotFoundError: Error, LocalizedError {
    
    var key: String
    
    init(key: String) {
        self.key = key
    }
    
    public var errorDescription: String? {
        return "\(key) is Empty"
    }
}
