//
//  FavoritesMoviesConverterTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/15/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class FavoritesMoviesConverterTests: XCTestCase {
    
    var movieJSON: String!
    var movieWithoutTitle: String!
    
    override func setUp() {
        var resourcePath = Bundle(for: MovieTests.self).path(forResource: "Movie", ofType: "json")
        movieJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
        resourcePath = Bundle(for: MovieTests.self).path(forResource: "MovieWithoutTitle", ofType: "json")
        movieWithoutTitle = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }
    
    func testConvertMoviesDetailsAreCorrect() {
        let movie1 = MovieDetails(JSONString: movieJSON)
        let movie2 = MovieDetails(JSONString: movieWithoutTitle)
        let movies = [movie1!, movie2!]
        
        let converted = FavoritesMoviesConverter.convertCells(from: movies)
        let correstResult = [MovieItem(movieDetails: movie1!), MovieItem(movieDetails: movie2!)]
        
        XCTAssertEqual(converted.count, correstResult.count)
        XCTAssertEqual(converted.first?.id, correstResult.first?.id)
        XCTAssertEqual(converted.last?.id, correstResult.last?.id)
    }

}
