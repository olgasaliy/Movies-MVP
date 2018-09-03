//
//  MovieDetailsConverter.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/27/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class MovieDetailsConverter {
    
    private let details: MovieDetails
    
    init(_ details: MovieDetails) {
        self.details = details
    }
    
    func convertSections() -> [TableViewSectionItem] {
        let generalSection = convertGeneralSection()
        let overviewSection = convertOverviewSection()
        var result = [generalSection, overviewSection]
        if let companySection = convertCompanySection() {
            result.append(companySection)
        }
        return result
    }
    
    private func convertGeneralSection() -> TableViewSectionItem  {
        let section = TableViewSectionItem(name: "General", items: [GeneralDetailsItem(details)])
        return section
    }
    
    private func convertOverviewSection() -> TableViewSectionItem  {
        let section = TableViewSectionItem(name: "Overview", items: [OverviewDetailsItem(details)])
        return section
    }
    
    private func convertCompanySection() -> TableViewSectionItem?  {
        guard let companies = details.companies else {
            return nil
        }
        let section = TableViewSectionItem(name: "Production Companies", items: companies.compactMap { CompanyDetailsItem($0) })
        return section
    }
    
}
