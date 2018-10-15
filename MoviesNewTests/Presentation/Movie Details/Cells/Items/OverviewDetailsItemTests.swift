//
//  OverviewDetailsItemTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/15/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class OverviewDetailsItemTests: XCTestCase {

    enum MovieData: String {
        case correct = "MovieDetails"
        case withoutOverview = "MovieDetailsWithoutOverview"
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
        
        let result = OverviewDetailsItem(movie!)
        
        XCTAssertEqual(result.overview, "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
    }
    
    func testMovieDetailsWithoutOverview() {
        type = .withoutOverview
        let movie = MovieDetails(JSONString: movieJSON)
        
        let result = OverviewDetailsItem(movie!)
        
        XCTAssertEqual(result.overview, "No overview")
    }
    
    func testCellIdentifier() {
        type = .correct
        let movie = MovieDetails(JSONString: movieJSON)
        
        let result = OverviewDetailsItem(movie!)
        
        XCTAssertEqual(result.cellIdentifier, "overviewDetailsCell")
    }
    
}
