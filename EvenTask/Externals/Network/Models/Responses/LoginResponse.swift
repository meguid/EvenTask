//
//  LoginResponse.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class LoginResponse: Codable {
    var user: User
    var token: Token
    init() {
        user = User()
        token = Token()
    }
}
