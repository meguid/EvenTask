//
//  IsValidPassowrd.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class IsValidPassword: BaseValidator {
    
    var value: String?
    
    init(value: String?) {
        self.value = value
    }
    
    func orThrow() throws {
        
        if let value = value {
            if value.count >= 8 {
                return
            }
        }
        throw error()
    }
    
    func error() -> NSError {
        return NSError(domain: "NotValidPassword", code: 100,
                       userInfo: [NSLocalizedDescriptionKey: "Please enter a valid password with at least 8 characters"])
    }
}
