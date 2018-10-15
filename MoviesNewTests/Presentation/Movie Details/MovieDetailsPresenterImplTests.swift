//
//  MovieDetailsPresenterImplTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/12/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class MovieDetailsPresenterImplTests: XCTestCase {

    var viewMock: MovieDetailsViewMock!
    var dataProviderMock: MoviesDataProviderMock!
    var presenter: MovieDetailsPresenter!
    
    var detailsJSON: String!
    
    override func setUp() {
        viewMock = MovieDetailsViewMock()
        dataProviderMock = MoviesDataProviderMock()
        presenter = MovieDetailsPresenterImpl(viewMock, dataProviderMock, FavoriteRepositoryMock(CoreDataConteiner.default))
        
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "MovieDetails", ofType: "json")
        detailsJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIdIsNil() {
        // preparing
        dataProviderMock.movieDetails = nil
        
        // executing
        presenter.getDetails(by: nil)
        
        // verifying
        XCTAssertEqual("Urecognized movie", viewMock.shownError)
    }
    
    func testErrorOccursWhileDownloading() {
        // preparing
        dataProviderMock.movieDetails = nil
        dataProviderMock.error = NSError(domain: "Domain", code: 101, userInfo: nil)
        
        // executing
        presenter.getDetails(by: 5)
        
        // verifying
        XCTAssertEqual(viewMock.shownError, "The operation couldn’t be completed. (Domain error 101.)")
     }
    
    func testProgressIsHidden() {
        // preparing
        dataProviderMock.movieDetails = MovieDetails(JSONString: detailsJSON)
        
        // executing
        presenter.getDetails(by: 550)
        
        // verifying
        XCTAssertFalse(viewMock.isProgressDisplayed)
    }

    func testDetailsAreDisplayed() {
        // preparing
        dataProviderMock.movieDetails = MovieDetails(JSONString: detailsJSON)
        
        // executing
        presenter.getDetails(by: 550)
        
        // verifying
        XCTAssertTrue(viewMock.isMovieDetailsDisplayed)
    }
    
}
