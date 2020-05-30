//
//  APIConfig.swift
//  COVID
//
//  Created by Pawan kumar on 02/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import Foundation

struct Configuration {
    lazy var environment: Environment = {
        return Environment.Development
    }()
}

enum Environment: String {
    
    case Development = "development"
    case Staging = "staging"
    case Production = "production"
    
    //Base URL
    
    var baseURL: String {
        switch self {
            
        case .Development:
            return "https://api.covid19api.com/"
        case .Staging:
            return "https://api.covid19api.com/"
        case .Production:
            return "https://api.covid19api.com/"
        }
    }
}


struct APIConfig {

    // Initialize Configuration
    static var config = Configuration()
    
    //Base URL
    static let baseURL: String = config.environment.baseURL
     
    // MARK: --------------- Base APIs URL -------------------------------------
    
    //Countries List
    static let summaryApi: String = "\(baseURL)summary"
    
   
    // MARK: ---------------  Constant -------------------------------------

    //Currency Symbol
    static let currency_symbol: String = "₹"
    
    //isLoginIn
    static let isLoginIn: String = "isLoginIn"
}





