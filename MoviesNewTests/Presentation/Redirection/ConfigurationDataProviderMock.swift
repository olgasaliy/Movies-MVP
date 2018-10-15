//
//  ConfigurationDataProviderMock.swift
//  MoviesNewTests
//
//  Created by Olga Saliy on 10/15/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
@testable import MoviesNew

class ConfigurationDataProviderMock: ConfigurationDataProvider {
    
    var config: Configuration?
    var error: Error?
    
    override func getConfiguration(completion: @escaping (Configuration?, Error?) -> ()) {
        completion(config, error)
    }
    
}
