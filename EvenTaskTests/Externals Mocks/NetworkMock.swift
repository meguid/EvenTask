//
//  NetworkMock.swift
//  EvenTaskTests
//
//  Created by Ahmed Meguid on 12/13/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
@testable import EvenTask
@testable import Promises

class NetworkMock: NetworkProtocol {

    var object: Codable?
    var error: NetworkError?
    
    init() { }
    
    init(error: NetworkError) {
        self.error = error
    }
    
    init(object: Codable) {
        self.object = object
    }
    
    func callModel<T: Codable>(model: T, url: URL, method: String, parameters: [String: Any], headers: [String: Any]) -> Promise<T> {
        return Promise<T>(on: .main) { fulfill, reject in
            if let object = self.object as? T {
                fulfill(object)
            } else {
                reject(self.error ?? NetworkError.networkFail(error: ""))
            }
        }
    }
}
