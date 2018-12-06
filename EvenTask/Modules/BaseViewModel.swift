//
//  BaseViewModel.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class BaseViewModel {
    
    var router: RouterProtocol
    var cache: CacheProtocol
//    var location: LocationProtocol
//    var network: NetworkProtocol

    var baseInteractor: BaseInteractor
    
    init(cache: CacheProtocol, router: RouterProtocol, network: NetworkProtocol, location: LocationProtocol) {
        self.router = router
        self.cache = cache
//        self.location = location
//        self.network = network
        self.baseInteractor = BaseInteractor(network: network, location: location, cache: cache)
    }
}
