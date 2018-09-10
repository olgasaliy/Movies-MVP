//
//  GeneralDetailsCell.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

protocol GeneralDetailsCellDelegate: class {
    
    func didPressLikeButton()
    func didUnpressLikeButton()
}

class GeneralDetailsCell: UITableViewCell {
    
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var rating: UILabel!
    @IBOutlet private weak var language: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var releaseDate: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    
    weak var delegate: GeneralDetailsCellDelegate?
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        if likeButton.currentImage == #imageLiteral(resourceName: "liked") {
            delegate?.didUnpressLikeButton()
            likeButton.setImage(#imageLiteral(resourceName: "notliked"), for: .normal)
        } else {
            delegate?.didPressLikeButton()
            likeButton.setImage(#imageLiteral(resourceName: "liked"), for: .normal)
        }
    }
}

extension GeneralDetailsCell: ConfigurableCell {
    
    func configure(with item: TableViewCellItem) {
        guard let item = item as? GeneralDetailsItem else {
            return
        }
        
        self.title.text = item.title
        self.rating.text = item.rating
        self.language.text = item.originalLanguage
        self.releaseDate.text = item.releaseDate
        setImage(by: item.imageURL)
    }
    
    private func setImage(by url: String?) {
        guard let imageUrl = url else {
            self.posterImage.image = #imageLiteral(resourceName: "not-available")
            return
        }
        self.posterImage.load(from: imageUrl)
    }
}

extension GeneralDetailsCell: MovieDetailsTableViewControllerDelegate {
    
    func didLikeMovie() {
        likeButton.setImage(#imageLiteral(resourceName: "liked"), for: .normal)
    }
    
}
