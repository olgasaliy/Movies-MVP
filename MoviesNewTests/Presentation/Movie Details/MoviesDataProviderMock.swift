//
//  MoviesDataProviderMock.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/12/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
@testable import MoviesNew

class MoviesDataProviderMock: MoviesDataProvider {
    
    var movieDetails: MovieDetails?
    var error: Error?
    
    override func getDetails(by id: Int, completion: @escaping (MovieDetails?, Error?) -> ()) {
        completion(movieDetails, error)
    }
    
}
