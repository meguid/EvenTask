//
//  ExternalProtocols.swift
//
//  Created by Ahmed Meguid on 12/4/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
import Promises

protocol LocationProtocol {
    func startTracking()
    func getCurrentLocation() -> (lat: Double, long: Double)
}

protocol CacheProtocol {
    func getObject<T>(_ object: T, key: String) -> T?
    func saveObject<T: Any>(_ object: T, key: String)
    func removeObject(key: String)
}

protocol NetworkProtocol {
    func callData(url: URL, method: String, parameters: [String: Any], headers: [String: Any]) -> Promise<Data>
    func callJson<Model: Codable>(model: Model, url: URL, method: String, parameters: [String: Any], headers: [String: Any]) -> Promise<[String: Any]>
    func callModel<T: Codable>(model: T, url: URL, method: String, parameters: [String: Any], headers: [String: Any]) -> Promise<T>
}

protocol RouterProtocol {
    var presentedView: BaseView! {set get}
    func present(view: BaseView)
    func startActivityIndicator()
    func stopActivityIndicator()
    func dismiss()
    func pop()
    func segue(identifier: String)
    func alert(title: String, message: String, actions: [(title: String, style: UIAlertAction.Style)])
}
