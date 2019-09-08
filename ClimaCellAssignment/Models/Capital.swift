//
//  Capitals.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 02/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import Foundation

struct Capital : Codable {
    
    let country : String?
    let countryCode : String?
    let capital : String?
    
    enum CodingKeys: String, CodingKey {
        
        case country = "name"
        case countryCode = "alpha2Code"
        case capital = "capital"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        capital = try values.decodeIfPresent(String.self, forKey: .capital)
    }
    
}
