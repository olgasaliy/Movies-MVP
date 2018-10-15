//
//  MoviesPresenterImplTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/9/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class MoviesPresenterImplTests: XCTestCase {

    var viewMock: MoviesViewMock!
    var dataProviderMock: SearchResultDataProviderMock!
    var presenter: MoviesPresenter!
    
    var searchResultJSON: String!
    
    override func setUp() {
        viewMock = MoviesViewMock()
        dataProviderMock = SearchResultDataProviderMock()
        presenter = MoviesPresenterImpl(viewMock, dataProviderMock)
        
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "SearchResult", ofType: "json")
        searchResultJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }

    override func tearDown() {
         dataProviderMock.error = nil
    }
    
    func testQueryIsEmpty() {
        // preparing
        dataProviderMock.searchResults = nil
        
        // executing
        presenter.search(by: "")
        
        // verifging
        XCTAssertTrue(viewMock.displayedMovies.isEmpty)
    }
    
    func testProgressIsDisplayed() {
        // preparing
        dataProviderMock.searchResults = nil
        
        // executing
        presenter.search(by: "any")
        
        // verifying
        XCTAssertTrue(viewMock.isProgressDisplayed)
    }
    
    func testErrorIsShown() {
        // preparing
        dataProviderMock.searchResults = nil
        dataProviderMock.error = NSError(domain: "Domain", code: 101, userInfo: nil)

        // executing
        presenter.search(by: "any")
        
        // verifying
        XCTAssertEqual(viewMock.shownError, "The operation couldn’t be completed. (Domain error 101.)")
    }
    
    func testProgressIsHidden() {
        // preparing
        dataProviderMock.searchResults = SearchResult(JSONString: searchResultJSON)
        
        // executing
        presenter.search(by: "any")
        
        // verifying
        XCTAssertFalse(viewMock.isProgressDisplayed)
    }
    
    func testMoviesAreDisplayed() {
        // preparing
        dataProviderMock.searchResults = SearchResult(JSONString: searchResultJSON)
        
        // executing
        presenter.search(by: "Gump")
        
        // verifying
        XCTAssertTrue(viewMock.displayedMovies.count > 0)
    }

}
