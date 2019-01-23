//
//  NotValidPasswordError.swift
//  EvenTask
//
//  Created by Ahmed Meguid on 1/23/19.
//  Copyright © 2019 Ahmed Meguid. All rights reserved.
//

import Foundation

class NotValidPasswordError: Error, LocalizedError {
    public var errorDescription: String? {
        return "Please enter a valid password with at least 8 characters"
    }
}
