//
//  MovieDetails.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieDetails: Mappable {
    
    var id: Int?
    var title: String?
    var releaseDate: String?
    var posterPath: String?
    var rating: Double?
    var spokenLanguages: [SpokenLanguage]?
    var overview: String?
    var companies: [ProductionCompany]?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        releaseDate <- map["release_date"]
        posterPath <- map["poster_path"]
        rating <- map["vote_average"]
        spokenLanguages <- map["spoken_languages"]
        overview <- map["overview"]
        companies <- map["production_companies"]
    }
    
}
