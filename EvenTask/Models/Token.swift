//
//  Token.swift
//  Archtrials
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class Token: Codable {
    var id: Int
    var token: String
    
    init() {
        id = 0
        token = ""
    }
}
