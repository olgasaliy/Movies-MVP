//
//  GeneralDetailsItemTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/15/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class GeneralDetailsItemTests: XCTestCase {

    enum MovieData: String {
        case correct = "MovieDetails"
        case withoutTitle = "MovieDetailsWithoutTitle"
        case withoutRating = "MovieDetailsWithoutRating"
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
    
    func testMovieDetailsIsCorrect() {
        type = .correct
        let movie = MovieDetails(JSONString: movieJSON)
        
        let result = GeneralDetailsItem(movie!)
        
        XCTAssertEqual(result.title,"Fight Club")
        XCTAssertEqual(result.rating, "7.8/10")
        XCTAssertEqual(result.releaseDate, "1999-10-12")
        XCTAssertEqual(result.originalLanguage, "English")

        XCTAssertNil(result.imageURL)
    }
    
    func testMovieDetailsWithoutTitle() {
        type = .withoutTitle
        let movie = MovieDetails(JSONString: movieJSON)
        
        let result = GeneralDetailsItem(movie!)
        
        XCTAssertEqual(result.title, "Unknown")
    }
    
    func testMovieDetailsWithoutRating() {
        type = .withoutRating
        let movie = MovieDetails(JSONString: movieJSON)
        
        let result = GeneralDetailsItem(movie!)
        
        XCTAssertEqual(result.rating, "0.0/10")
    }
    
    func testCellIdentifier() {
        type = .correct
        let movie = MovieDetails(JSONString: movieJSON)
        
        let result = GeneralDetailsItem(movie!)
        
        XCTAssertEqual(result.cellIdentifier, "generalDetailsCell")
    }

}
