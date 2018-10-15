//
//  RedirectionViewMock.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/15/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
@testable import MoviesNew

class RedirectionViewMock: RedirectionView {
    
    var shownError: String = ""
    var viewDidRedirect = false
    
    func redirect(to controller: String, in storyboard: String) {
        viewDidRedirect = true
    }
    
    func show(error: String) {
        shownError = error
    }
    
}
