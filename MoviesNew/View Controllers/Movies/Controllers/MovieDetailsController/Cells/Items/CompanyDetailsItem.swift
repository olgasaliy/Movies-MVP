//
//  CompanyDetailsItem.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import UIKit

class CompanyDetailsItem: TableViewCellItem {
    
    let name: String
    
    init(_ company: ProductionCompany) {
        self.name = company.name ?? "Undefined"
    }
    
    var cellIdentifier: String {
        return "companyDetailsCell"
    }
    
    func configure(cell: UITableViewCell) {
        (cell as! CompanyDetailsCell).configure(with: self)
    }
    
}
