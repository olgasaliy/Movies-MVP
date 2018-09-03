//
//  GeneralDetailsCell.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class GeneralDetailsCell: UITableViewCell {
    
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var rating: UILabel!
    @IBOutlet private weak var language: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var releaseDate: UILabel!
    
}

extension GeneralDetailsCell: ConfigurableCell {
    
    func configure(with item: TableViewCellItem) {
        guard let item = item as? GeneralDetailsItem else {
            return
        }
        // TODO: replace with actual image
        self.posterImage.image = #imageLiteral(resourceName: "not-available")
        self.title.text = item.title
        self.rating.text = item.rating
        self.language.text = item.originalLanguage
        self.releaseDate.text = item.releaseDate
    }
    
}
