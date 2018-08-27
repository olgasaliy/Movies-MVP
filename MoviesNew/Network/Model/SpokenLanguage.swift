//
//  SpokenLanguage.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper

class SpokenLanguage: Mappable {
    
    var iso: Int?
    var name: String?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        iso <- map["iso_639_1"]
        name <- map["name"]
    }
    
}
