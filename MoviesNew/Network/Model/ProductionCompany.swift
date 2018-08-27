//
//  ProductionCompany.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductionCompany: Mappable {
    
    var id: Int?
    var name: String?
    var originCountry: String?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        originCountry <- map["origin_country"]
    }
    
}
