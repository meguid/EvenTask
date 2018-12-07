//
//  LoginViewModel.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
import SimpleTwoWayBinding

class LoginViewModel: BaseViewModel {

    var email: Observable<String> = Observable()
    var password: Observable<String> = Observable()

    func login() {
        LoginInteractor(email.value, password.value, base: baseInteractor).execute(LoginResponse()).then { (response) in
            self.cache.saveObject(response.user, key: .user)
            self.cache.saveObject(response.token, key: .token)
            self.router.segue(storyboard: .events(view: .eventsList))
        }.catch { (error) in
            self.router.alert(title: "Warning", message: error.localizedDescription, actions: [("ok", .default)])
        }
    }
}
