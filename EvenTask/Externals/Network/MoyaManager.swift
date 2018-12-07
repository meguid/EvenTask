//
//  MoyaManager.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
import Promises

class MoyaManager: NetworkProtocol {
    
    func callData(url: URL, method: String, parameters: [String: Any], headers: [String: Any]) -> Promise<Data> {
        return Promise<Data>(on: .main) { fulfill, reject in
            fulfill(Data())
        }
    }
    
    func callJson<Model: Codable>(model: Model, url: URL, method: String, parameters: [String: Any], headers: [String: Any]) -> Promise<[String: Any]> {
        return Promise<[String: Any]>(on: .main) { fulfill, reject in
            fulfill([String: Any]())
        }
    }
    
    func callModel<T: Codable>(model: T, url: URL, method: String, parameters: [String: Any], headers: [String: Any]) -> Promise<T> {
        return Promise<T>(on: .main) { fulfill, reject in
            fulfill(model)
        }
    }
}
