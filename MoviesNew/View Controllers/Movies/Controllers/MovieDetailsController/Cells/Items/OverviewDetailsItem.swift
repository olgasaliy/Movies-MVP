//
//  OverviewDetailsItem.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import UIKit

class OverviewDetailsItem: TableViewCellItem {
    
    let overview: String
    
    init(_ movie: MovieDetails) {
        self.overview = movie.overview ?? "No overview"
    }
    
    var cellIdentifier: String {
        return "overviewDetailsCell"
    }
    
    func configure(cell: UITableViewCell) {
        (cell as! OverviewDetailsCell).configure(with: self)
    }
    
}
