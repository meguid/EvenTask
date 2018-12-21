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
    func getData(key: CachingKey) -> [Data]?
    func saveData(_ data: Data?, key: CachingKey)
    func getObject<T: Codable>(_ object: T, key: CachingKey) -> T?
    func saveObject<T: Codable>(_ object: T, key: CachingKey)
    func removeObject(key: CachingKey)
}

protocol NetworkProtocol {
    func callModel<T: Codable>(model: T, url: URL, method: String, parameters: [String: Any], headers: [String: Any]) -> Promise<T>
}

protocol RouterProtocol {
    var presentedView: BaseView! {set get}
    func present(view: BaseView)
    func startActivityIndicator()
    func stopActivityIndicator()
    func dismiss()
    func pop()
    func segue(storyboard: Storyboard)
    func alert(title: String, message: String, actions: [(title: String, style: UIAlertAction.Style)])
}
