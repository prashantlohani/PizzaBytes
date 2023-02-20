//
//  ServerConfig.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 20/02/23.
//

import Foundation

enum BaseUrl:String {
    case LOCAL = "https:\\abc-local.com"
    case DEV = "https:\\abc-dev.com"
    case QA = "https:\\abc-qa.com"
    case PROD = "https:\\abc-prod.com"
    case DEMO = "https:\\abc-demo.com"
}

class ServerConfig {
    static let shared:ServerConfig = ServerConfig()
    
    var baseUrl:String?
    
    func setUpServerConfig() {
        print("setUpServerConfig")
        #if LOCAL
        self.baseUrl = BaseUrl.LOCAL.rawValue
        #elseif DEV
        self.baseUrl = BaseUrl.DEV.rawValue
        #elseif QA
        self.baseUrl = BaseUrl.QA.rawValue
        #elseif PROD
        self.baseUrl = BaseUrl.PROD.rawValue
        #elseif DEMO
        self.baseUrl = BaseUrl.DEMO.rawValue
        #endif
    }
}
