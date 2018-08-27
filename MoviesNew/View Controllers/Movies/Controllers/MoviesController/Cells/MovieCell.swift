//
//  MovieCell.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/20/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var name: UILabel!
    
}

extension MovieCell: ConfigurableCell {

    func configure(with item: TableViewCellItem) {
        guard let item = item as? MovieItem else {
            return
        }
        // TODO: replace with actual image
        self.imageLogo.image = #imageLiteral(resourceName: "not-available")
        self.name.text = item.title
    }
    
}
