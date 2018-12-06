//
//  User.swift
//  Archtrials
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class User: Codable {
    var id: Int
    var username: String
    var imageUrl: String
    
    init() {
        id = 0
        username = ""
        imageUrl = ""
    }
}
