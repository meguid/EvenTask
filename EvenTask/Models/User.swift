//
//  User.swift
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
    
    init(id: Int, username: String, imageUrl: String) {
        self.id = id
        self.username = username
        self.imageUrl = imageUrl
    }
}
