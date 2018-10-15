//
//  MovieTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/8/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class MovieTests: XCTestCase {

    var movieJSON: String!
    
    override func setUp() {
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "Movie", ofType: "json")
        movieJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }

    func testMappingFromJSONisCorrect() {
        let movie = Movie(JSONString: movieJSON)
        XCTAssertEqual(1, movie?.id)
        XCTAssertEqual("Forest Gump", movie?.title)
        XCTAssertNil(movie?.posterPath)
    }
    
}
