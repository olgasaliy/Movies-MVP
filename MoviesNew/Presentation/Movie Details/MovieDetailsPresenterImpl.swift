//
//  MovieDetailsPresenterImpl.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class MovieDetailsPresenterImpl: MovieDetailsPresenter {
    
    private weak var view: MovieDetailsView?
    private let dataProvider: MoviesDataProvider
    
    init(_ view: MovieDetailsView?, _ dataProvider: MoviesDataProvider) {
        self.view = view
        self.dataProvider = dataProvider
    }
    
    func getDetails(by id: Int) {
        dataProvider.getDetails(by: id, completion: movieDetailsLoaded(_:_:))
    }
    
    private func movieDetailsLoaded(_ movieDetail: MovieDetails?, _ error: Error?) {
        guard let details = movieDetail, error == nil else {
            view?.show(error: error?.localizedDescription ?? "Unknown error")
            return
        }
        
        view?.hideProgress()
        let sections = MovieDetailsConverter(details).convertSections()
        view?.display(details: sections)
    }
}
