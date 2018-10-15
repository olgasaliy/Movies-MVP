//
//  SearchResultDataProviderMock.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/9/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
@testable import MoviesNew

class SearchResultDataProviderMock: SearchResultDataProvider {
    
    var searchResults: SearchResult?
    var error: Error?
    
    override func search(by query: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        completion(searchResults, error)
    }
    
}
