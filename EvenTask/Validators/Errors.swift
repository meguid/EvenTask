//
//  Exceptions.swift
//  EvenTask
//
//  Created by Ahmed Meguid on 12/7/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

struct NotValidEmailError: Error {
    var localizedDescription: String { return "Please enter a valid email"}
}

struct NotValidPasswordError: Error {
    var localizedDescription: String { return "Please enter a valid password with at least 8 characters"}
}

struct EmptyValueError: Error {
    var key: String
    var localizedDescription: String { return "Please fill in the \(key) value"}
}

struct NotFoundError: Error {
    var key: String
    var localizedDescription: String { return "\(key) is Empty"}
}
