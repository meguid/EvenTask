//
//  LoginInteractor.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
import Promises

class LoginInteractor: BaseInteractor {
    
    var email: String?
    var password: String?
    
    init(_ email: String?, _ password: String?, base: BaseInteractor) {
        super.init(network: base.network, location: base.location, cache: base.cache)
        self.email = email
        self.password = password
    }
    
    override func validate() throws {
        try NotEmpty(value: email, key: .emailFieldKey).orThrow()
        try NotEmpty(value: password, key: .passwordFieldKey).orThrow()
        try IsValidPassword(value: password).orThrow()
        try IsValidEmail(value: email).orThrow()
    }
    
    override func process<T: Codable>(_ model: T) -> Promise<T> {
        return network.callModel(model: model,
                                 url: URL(string: "/login")!,
                                 method: "post",
                                 parameters: ["email": email!, "password": password!],
                                 headers: [:])
    }
}
