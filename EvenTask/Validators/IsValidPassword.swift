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
        throw NotValidPasswordError()
    }
}
