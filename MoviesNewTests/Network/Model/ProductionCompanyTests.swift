//
//  ProductionCompanyTests.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/12/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import XCTest
@testable import MoviesNew

class ProductionCompanyTests: XCTestCase {

    var productionCompanyJSON: String!
    
    override func setUp() {
        let resourcePath = Bundle(for: MovieTests.self).path(forResource: "ProductionCompany", ofType: "json")
        productionCompanyJSON = try! String(contentsOfFile: resourcePath!, encoding: .utf8)
    }

    func testMappingFromJSONisCorrect() {
        let company = ProductionCompany(JSONString: productionCompanyJSON)
        XCTAssertEqual(508, company?.id)
        XCTAssertEqual("Regency Enterprises", company?.name)
        XCTAssertEqual("US", company?.originCountry)
    }

}
