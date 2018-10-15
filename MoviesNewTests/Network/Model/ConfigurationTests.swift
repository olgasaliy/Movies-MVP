//
//  ConfigurationTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/12/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class ConfigurationTests: XCTestCase {

    var configurationJSON: String!

    override func setUp() {
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "Configuration", ofType: "json")
        configurationJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }
    
    func testMappingFromJSONisCorrect() {
        let configuration = Configuration(JSONString: configurationJSON)
        XCTAssertNotNil(configuration?.images)
    }

}
