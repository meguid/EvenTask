//
//  Exceptions.swift
//  EvenTask
//
//  Created by Ahmed Meguid on 12/7/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

enum ValidationError: Error {
    case emptyValue(key: String)
    case notFound(key: String)
    case notValidEmail()
    case notValidPassword()

    var message: String {
        switch self {
        case .emptyValue(let key): return "Please fill in the \(key) value"
        case .notFound(let key): return "\(key) is Empty"
        case .notValidEmail(): return "Please enter a valid email"
        case .notValidPassword(): return "Please enter a valid password with at least 8 characters"
        }
    }
}
    
extension ValidationError: LocalizedError {
    public var errorDescription: String? {
        return self.message
    }
}
