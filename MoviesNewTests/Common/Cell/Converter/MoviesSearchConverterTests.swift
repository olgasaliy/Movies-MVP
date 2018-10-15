//
//  MoviesSearchConverterTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/15/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class MoviesSearchConverterTests: XCTestCase {
    
    var movieJSON: String!
    var movieWithoutTitle: String!

    override func setUp() {
        var resourcePath = Bundle(for: MovieTests.self).path(forResource: "Movie", ofType: "json")
        movieJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
        resourcePath = Bundle(for: MovieTests.self).path(forResource: "MovieWithoutTitle", ofType: "json")
        movieWithoutTitle = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }

    func testConvertMoviesAreCorrect() {
        let movie1 = Movie(JSONString: movieJSON)
        let movie2 = Movie(JSONString: movieWithoutTitle)
        let movies = [movie1!, movie2!]
        
        let converted = MoviesSearchConverter.convertCells(from: movies)
        let correstResult = [MovieItem(movie: movie1!), MovieItem(movie: movie2!)]
        
        XCTAssertEqual(converted.count, correstResult.count)
        XCTAssertEqual(converted.first?.id, correstResult.first?.id)
        XCTAssertEqual(converted.last?.id, correstResult.last?.id)
    }

}
