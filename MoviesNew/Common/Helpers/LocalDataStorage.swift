//
//  LocalDataStorage.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class LocalDataStorage {
    
    static let `default`: LocalDataStorage = {
        return LocalDataStorage()
    }()
    
    var imageUrl: String?
    
    private init() {}
    
}
