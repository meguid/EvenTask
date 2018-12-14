//
//  LoginTests.swift
//  EvenTaskTests
//
//  Created by Ahmed Meguid on 12/13/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import XCTest
@testable import EvenTask
@testable import Promises

class LoginTests: BaseModuleTests {

    var viewModel: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        initialize()
    }
    
    func initialize() {
        viewModel = LoginViewModel(cache: cache, router: router, network: network, location: location)
    }

    override func tearDown() {
        viewModel = nil
    }

    func testingLoginWithEmptyEmailShouldAlertWithError() {
        
        //Given Nothing
        
        //When
        viewModel.login()
        _ = waitForPromises(timeout: 10)
        
        //Then
        let expectedError = ValidationError.emptyValue(key: "email").localizedDescription
        XCTAssertEqual(router.actions.count, 1)
        XCTAssertEqual(router.actions[0], .alert(expectedError))
    }
    
    func testingLoginWithEmptyPasswordShouldAlertWithError() {
        
        //Given
        viewModel.email.value = "email"

        //When
        viewModel.login()
        _ = waitForPromises(timeout: 10)
        
        //Then
        let expectedError = ValidationError.emptyValue(key: "password").localizedDescription
        XCTAssertEqual(router.actions.count, 1)
        XCTAssertEqual(router.actions[0], .alert(expectedError))
    }
    
    func testingLoginWithInValidPasswordShouldAlertWithError() {
        
        //Given
        viewModel.email.value = "email"
        viewModel.password.value = "short"

        //When
        viewModel.login()
        _ = waitForPromises(timeout: 10)
        
        //Then
        let expectedError = ValidationError.notValidPassword().localizedDescription
        XCTAssertEqual(router.actions.count, 1)
        XCTAssertEqual(router.actions[0], .alert(expectedError))
    }
    
    func testingLoginWithInValidEmailShouldAlertWithError() {
        
        //Given
        viewModel.email.value = "email"
        viewModel.password.value = "longEnoughPassword"
        
        //When
        viewModel.login()
        _ = waitForPromises(timeout: 10)
        
        //Then
        let expectedError = ValidationError.notValidEmail().localizedDescription
        XCTAssertEqual(router.actions.count, 1)
        XCTAssertEqual(router.actions[0], .alert(expectedError))
    }
    
    func testingLoginWithFailNetworkResponseShouldAlertWithError() {
        
        //Given
        let error = NetworkError.networkFail(error: "Invalid Credentials")
        network = NetworkMock(error: error)
        initialize()
        viewModel.email.value = "email@meguid.com"
        viewModel.password.value = "longEnoughPassword"
        
        //When
        viewModel.login()
        _ = waitForPromises(timeout: 10)
        
        //Then
        let expectedError = error.localizedDescription
        XCTAssertEqual(router.actions.count, 1)
        XCTAssertEqual(router.actions[0], .alert(expectedError))
    }
    
    func testingLoginWithSuccessNetworkResponseShould() {
        
        //Given
        let user = User(id: 11, username: "me9uid", imageUrl: "url")
        let token = Token(id: 13, token: "accessToken95")
        let response = LoginResponse(user: user, token: token)
        network = NetworkMock(object: response)
        initialize()
        viewModel.email.value = "email@meguid.com"
        viewModel.password.value = "longEnoughPassword"
        
        //When
        viewModel.login()
        _ = waitForPromises(timeout: 10)
        
        //Then
        let cachedUser = cache.getObject(User(), key: .user)
        XCTAssertEqual(cachedUser!.id, 11)
        XCTAssertEqual(cachedUser!.username, "me9uid")
        XCTAssertEqual(cachedUser!.imageUrl, "url")
        
        let cachedToken = cache.getObject(Token(), key: .token)
        XCTAssertEqual(cachedToken!.id, 13)
        XCTAssertEqual(cachedToken!.token, "accessToken95")
        
        XCTAssertEqual(router.actions.count, 1)
        let expectedSegueStoryboard = Storyboard.events(view: .eventsList).storyboard()
        XCTAssertEqual(router.actions[0], .segue(expectedSegueStoryboard.storyboardId,
                                                 expectedSegueStoryboard.viewId))
    }
}
