//
//  LoginView.swift
//  Archtrials
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

class LoginView: BaseView {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    var viewModel: LoginViewModel!
    
    override func initialize() {
        emailField.text = ""
        passwordField.text = ""
    }
    
    override func bind() {
        viewModel = LoginViewModel(cache: cache, router: router, network: network, location: location)
        emailField.bind(with: viewModel.email)
        passwordField.bind(with: viewModel.password)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        viewModel.login()
    }
}
