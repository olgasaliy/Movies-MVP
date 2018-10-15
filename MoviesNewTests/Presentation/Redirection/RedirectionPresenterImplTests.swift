//
//  RedirectionPresenterImplTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/15/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class RedirectionPresenterImplTests: XCTestCase {

    var viewMock: RedirectionViewMock!
    var dataProviderMock: ConfigurationDataProviderMock!
    var presenter: RedirectionPresenter!
    
    var configJSON: String!
    
    override func setUp() {
        viewMock = RedirectionViewMock()
        dataProviderMock = ConfigurationDataProviderMock()
        presenter = RedirectionPresenterImpl(viewMock, dataProviderMock)
        
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "Configuration", ofType: "json")
        configJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }

    override func tearDown() {
        dataProviderMock.error = nil
    }
    
    func testConfigurationIsNil() {
        // preparing
        dataProviderMock.config = nil

        // executing
        presenter.loadConfigurations()

        // verifying
        XCTAssertEqual("Unknown error", viewMock.shownError)
    }
    
    func testErrorOccurs() {
        // preparing
        dataProviderMock.config = nil
        dataProviderMock.error = NSError(domain: "Domain", code: 101, userInfo: nil)
        
        // executing
        presenter.loadConfigurations()
        
        // verifying
        XCTAssertEqual(viewMock.shownError, "The operation couldn’t be completed. (Domain error 101.)")
    }
    
    func testViewIsRedirected() {
        // preparing
        dataProviderMock.config = Configuration(JSONString: configJSON)
        
        // executing
        presenter.loadConfigurations()
        
        // verifying
        XCTAssertTrue(viewMock.viewDidRedirect)
    }
    
}
