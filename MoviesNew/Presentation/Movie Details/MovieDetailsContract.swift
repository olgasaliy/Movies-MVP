//
//  MovieDetailsContract.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

protocol MovieDetailsView: class {
    
    func show(error: String)
    func display(details: TableViewCellItem)
    
}

protocol MovieDetailsPresenter {
    
    func getDetails(by id: Int)
    
}
