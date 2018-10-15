//
//  SpokenLanguageTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/12/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class SpokenLanguageTests: XCTestCase {

    var languageJSON: String!
    
    override func setUp() {
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "SpokenLanguage", ofType: "json")
        languageJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }
    
    func testMappingFromJSONisCorrect() {
        let language = SpokenLanguage(JSONString: languageJSON)
        XCTAssertEqual("en", language?.iso)
        XCTAssertEqual("English", language?.name)
    }

}
