//
//  RedirectionPresenterImpl.swift
//  MoviesNew
//
//  Created by Olga Saliy on 10/8/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class RedirectionPresenterImpl: RedirectionPresenter {
    
    private weak var view: RedirectionView?
    private let dataProvider: ConfigurationDataProvider
    
    init(_ view: RedirectionView?, _ dataProvider: ConfigurationDataProvider) {
        self.dataProvider = dataProvider
        self.view = view
    }
    
    func loadConfigurations() {
        dataProvider.getConfiguration { [weak self] (configuration, error) in
            guard let configuration = configuration, error == nil else {
                self?.view?.show(error: error?.localizedDescription ?? "Unknown error")
                return
            }
            
            LocalDataStorage.default.imageUrl = configuration.images.secure_base_url
            self?.view?.redirect(to: "initialController", in: "Main")
            
        }
    }
    
}
