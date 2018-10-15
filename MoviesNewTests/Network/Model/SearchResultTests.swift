//
//  SearchResultTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/12/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class SearchResultTests: XCTestCase {

    var searchResultJSON: String!
    
    override func setUp() {
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "SearchResult", ofType: "json")
        searchResultJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }

    func testMappingFromJSONisCorrect() {
        let searchResult = SearchResult(JSONString: searchResultJSON)
        XCTAssertEqual(1, searchResult?.page)
        XCTAssertEqual(1, searchResult?.totalPages)
        XCTAssertEqual(14, searchResult?.totalResults)
        XCTAssertEqual(14, searchResult?.results?.count)
    }

}
