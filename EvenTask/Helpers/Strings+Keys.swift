//
//  Strings+Keys.swift
//  EvenTask
//
//  Created by Ahmed Ramy on 12/7/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

extension String {
    // MARK:- Auth
    static let emailFieldKey = "email"
    static let passwordFieldKey = "password"
    
    // MARK:- Events Module
    static let eventTitleKey = "title"
    static let eventDescriptionKey = "description"
    static let eventPriorityKey = "priority"
    static let eventIsPermanentKey = "permanent"
    static let eventUserIDKey = "userId"
    
    // MARK:- Cache Keys
    static let userCacheKey = "user"
    static let tokenCacheKey = "token"
}
