//
//  CellsGenerator.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/22/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class CellsGenerator {
    
    static func generateCells(from movies:[Movie]) -> [MovieItem] {
        return movies.compactMap { MovieItem($0) }
    }
    
}
