//
//  GeneralDetailsItem.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import UIKit

class GeneralDetailsItem: TableViewCellItem {
    
    let title: String
    let imageURL: String?
    let rating: String
    let releaseDate: String?
    let originalLanguage: String?
    
    var cellIdentifier: String {
        return "generalDetailsCell"
    }
    
    init(_ movie: MovieDetails) {
        self.title = movie.title ?? "Unknown"
        self.imageURL = movie.posterPath
        self.rating = "\(movie.rating ?? 0.0)/10"
        self.releaseDate = movie.releaseDate
        self.originalLanguage = movie.spokenLanguages?.compactMap({ $0.name }).joined(separator: ", ")
    }
    
}
