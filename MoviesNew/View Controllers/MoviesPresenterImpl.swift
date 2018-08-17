//
//  MoviesPresenterImpl.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class MoviesPresenterImpl: MoviesPresenter {
    
    private weak var view: MoviesView?
    private let dataProvider: MoviesDataProvider
    
    init(_ view: MoviesView?) {
        self.view = view
        self.dataProvider = MoviesDataProvider()
    }
    
    func search(by query: String) {
        dataProvider.search(by: query) {[weak self] (data, error) in
            if let arrayOfMovies = data {
                self?.view?.setMovies(arrayOfMovies)
            } else {
                self?.view?.showError(error?.localizedDescription ?? "Unknown error")
            }
        }
    }
    
}
