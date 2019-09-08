//
//  CapitalCoordinates.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 06/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import Foundation

struct CapitalCoordinatesBase : Codable {
    
    let capitalCoordinates : [CapitalCoordinates]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.capitalCoordinates = try? container.decode([CapitalCoordinates].self)
    }
}

struct CapitalCoordinates : Codable {
    let longitude : String?
    let latitude : String?
    let capitalCity : String?
    
    enum CodingKeys: String, CodingKey {
        case longitude = "longitude"
        case latitude = "latitude"
        case capitalCity = "capitalCity"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        capitalCity = try values.decodeIfPresent(String.self, forKey: .capitalCity)
    }
}
