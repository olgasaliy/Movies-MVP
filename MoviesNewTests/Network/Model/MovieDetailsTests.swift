//
//  MovieDetailsTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/12/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class MovieDetailsTests: XCTestCase {

    var movieDetailsJSON: String!
    
    override func setUp() {
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "MovieDetails", ofType: "json")
        movieDetailsJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }

    func testMappingFromJSONisCorrect() {
        let movieDetails = MovieDetails(JSONString: movieDetailsJSON)
        XCTAssertEqual(550, movieDetails?.id)
        XCTAssertEqual("Fight Club", movieDetails?.title)
        XCTAssertEqual("1999-10-12", movieDetails?.releaseDate)
        XCTAssertNil(movieDetails?.posterPath)
        XCTAssertEqual(7.8, movieDetails?.rating)
        XCTAssertEqual("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.", movieDetails?.overview)
        XCTAssertEqual(7, movieDetails?.companies?.count)
        XCTAssertEqual(1, movieDetails?.spokenLanguages?.count)
    }

}
