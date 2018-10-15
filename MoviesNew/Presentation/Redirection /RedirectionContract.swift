//
//  RedirectionContract.swift
//  MoviesNew
//
//  Created by Olga Saliy on 10/8/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

protocol RedirectionView: class {
    
    func redirect(to controller: String, in storyboard: String)
    func show(error: String)
    
}

protocol RedirectionPresenter {
    
    func loadConfigurations()
    
}
