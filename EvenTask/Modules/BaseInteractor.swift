
//
//  BaseProcessor.swift
//  Archtrials
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
import Promises

class BaseInteractor {
    
    var network: NetworkProtocol
    var location: LocationProtocol
    var cache: CacheProtocol

    init(network: NetworkProtocol, location: LocationProtocol, cache: CacheProtocol) {
        self.network = network
        self.location = location
        self.cache = cache
    }
    
    func execute<T: Codable>(_ model: T) -> Promise<T> {
        do {
            extract()
            try validate()
            return process(model)
        } catch let error {
            return Promise<T>.init(error)
        }
    }
    
    func validate() throws {}
    
    func extract() {}
    
    func process<T: Codable>(_ model: T) -> Promise<T> {
        return Promise<T>.init(NSError(domain: "Error", code: 100, userInfo: nil))
    }
}
