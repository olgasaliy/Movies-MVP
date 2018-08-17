//
//  MoviesContract.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

protocol MoviesView: class {
    
    func setMovies(_ movies: [Movie])
    func showError(_ error: String)
    
}

protocol MoviesPresenter {
    
    func search(by query: String)
    
}
