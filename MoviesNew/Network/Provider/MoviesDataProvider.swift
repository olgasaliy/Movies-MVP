//
//  MoviesDataProvider.swift
//  Movies
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import Alamofire

class MoviesDataProvider: DataProvider {
    
    let searchResultDataProvider = SearchResultDataProvider()
    
    init() {
        let sessionManager = SessionManager(configuration: URLSessionConfiguration.default)
        super.init(sessionManager)
    }
    
    func search(by query: String, completion: @escaping (_ response: [Movie]?, _ error: Error?) -> ()) {
        searchResultDataProvider.search(by: query) { (dataSearchResult, error) in
            if let searchResult = dataSearchResult {
                completion(searchResult.results, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    func getDetails(by id: Int, completion: @escaping (_ response: Movie?, _ error: Error?) -> ()) {
        execute(request: MoviesRouter.getDetails(id: id), completion: completion)
    }
}
