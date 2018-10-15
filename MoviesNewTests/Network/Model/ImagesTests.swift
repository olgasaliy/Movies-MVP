//
//  ImagesTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/12/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class ImagesTests: XCTestCase {

    var imagesJSON: String!
    
    override func setUp() {
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "Images", ofType: "json")
        imagesJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }

    func testMappingFromJSONisCorrect() {
        let images = Images(JSONString: imagesJSON)
        XCTAssertEqual("https://image.tmdb.org/t/p/", images?.secure_base_url)
    }

}
