//
//  MovieItemTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/15/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class MovieItemTests: XCTestCase {

    enum MovieData: String {
        case correct = "Movie"
        case withoutTitle = "MovieWithoutTitle"
    }
    
    var type = MovieData.correct {
        didSet {
            loadDataFromFile()
        }
    }
    
    var movieJSON: String!
    
    func loadDataFromFile() {
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: type.rawValue, ofType: "json")
        movieJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }
    
    func testConvertMovieIsCorrect() {
        type = .correct
        let movie = Movie(JSONString: movieJSON)
        
        let result = MovieItem(movie: movie!)
        
        XCTAssertEqual(result.id, 1)
        XCTAssertEqual(result.title, "Forest Gump")
        XCTAssertNil(result.imageURL)
    }
    
    func testConvertMovieWithoutTitle() {
        type = .withoutTitle
        let movie = Movie(JSONString: movieJSON)
        
        let result = MovieItem(movie: movie!)
        
        XCTAssertEqual(result.title, "Unknown")
    }
    
    func testConvertMovieDetailsIsCorrect() {
        type = .correct
        let movie = MovieDetails(JSONString: movieJSON)
        
        let result = MovieItem(movieDetails: movie!)
        
        XCTAssertEqual(result.id, 1)
        XCTAssertEqual(result.title, "Forest Gump")
        XCTAssertNil(result.imageURL)
    }
    
    func testConvertMovieDetailsWithoutTitle() {
        type = .withoutTitle
        let movie = MovieDetails(JSONString: movieJSON)
        
        let result = MovieItem(movieDetails: movie!)
        
        XCTAssertEqual(result.title, "Unknown")
    }

    func testCellIdentifier() {
        type = .correct
        let movie = MovieDetails(JSONString: movieJSON)
        
        let result = MovieItem(movieDetails: movie!)
        
        XCTAssertEqual(result.cellIdentifier, "movieCell")
    }

}
