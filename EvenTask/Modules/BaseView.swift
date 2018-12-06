//
//  BaseView.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

class BaseView: UIViewController {
    
    var location: LocationProtocol = GoogleLocationManager()
    var network: NetworkProtocol = MoyaManager()
    var cache: CacheProtocol = CoreDataManager()
    var router: RouterProtocol = Router()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initialize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router.presentedView = self
        bind()
    }
    
    func initialize() {}
    func bind() {}
}
