//
//  MoviesNewMock.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/9/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
@testable import MoviesNew

class MoviesViewMock: MoviesView {
    
    var isProgressDisplayed = false
    var displayedMovies = [MovieItem]()
    var shownError: String = ""
    
    func displayProgress() {
        isProgressDisplayed = true
    }
    
    func hideProgress() {
        isProgressDisplayed = false
    }
    
    func display(movies: [MovieItem]) {
        displayedMovies = movies
    }
    
    func show(error: String) {
        shownError = error
    }

}
