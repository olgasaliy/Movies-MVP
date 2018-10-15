//
//  MovieDetailsViewMock.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/12/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
@testable import MoviesNew

class MovieDetailsViewMock: MovieDetailsView {
    
    var isProgressDisplayed = false
    var isMovieDetailsDisplayed = false
    var shownError: String = ""
    
    func displayProgress() {
        isProgressDisplayed = true
    }
    
    func hideProgress() {
        isProgressDisplayed = false
    }
    
    func show(error: String) {
        shownError = error
    }
    
    func display(details: [TableViewSectionItem]) {
        isMovieDetailsDisplayed = true
    }
    
}
