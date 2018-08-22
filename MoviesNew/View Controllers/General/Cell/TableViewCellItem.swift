//
//  TableViewCellItem.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/22/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCellItem {
    
    var cellIdentifier: String { get }
    func configure(cell: UITableViewCell)
    
}