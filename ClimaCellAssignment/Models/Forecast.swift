//
//  Forecast.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 04/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import Foundation

import Foundation
struct Forecast : Codable {
    let temp : [Temperature]?
    let precipitation : [Precipitation]?
    let precipitationProbability : PrecipitationProbability?
    let observationTime : ObservationTime?
    let lat : Double?
    let lon : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case temp = "temp"
        case precipitation = "precipitation"
        case precipitationProbability = "precipitation_probability"
        case observationTime = "observation_time"
        case lat = "lat"
        case lon = "lon"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temp = try values.decodeIfPresent([Temperature].self, forKey: .temp)
        precipitation = try values.decodeIfPresent([Precipitation].self, forKey: .precipitation)
        precipitationProbability = try values.decodeIfPresent(PrecipitationProbability.self, forKey: .precipitationProbability)
        observationTime = try values.decodeIfPresent(ObservationTime.self, forKey: .observationTime)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
    }
    
}

struct Temperature : Codable {
    let observationTime : String?
    let min : MinTemp?
    let max : MaxTemp?
    
    enum CodingKeys: String, CodingKey {
        
        case observationTime = "observation_time"
        case min = "min"
        case max = "max"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        observationTime = try values.decodeIfPresent(String.self, forKey: .observationTime)
        min = try values.decodeIfPresent(MinTemp.self, forKey: .min)
        max = try values.decodeIfPresent(MaxTemp.self, forKey: .max)
    }
    
}

struct MinTemp : Codable {
    let value : Double?
    let units : String?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case units = "units"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(Double.self, forKey: .value)
        units = try values.decodeIfPresent(String.self, forKey: .units)
    }
    
}

struct MaxTemp : Codable {
    let value : Double?
    let units : String?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case units = "units"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(Double.self, forKey: .value)
        units = try values.decodeIfPresent(String.self, forKey: .units)
    }
    
}

struct Precipitation : Codable {
    let observationTime : String?
    let max : MaxPrecipitation?
    
    enum CodingKeys: String, CodingKey {
        
        case observationTime = "observation_time"
        case max = "max"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        observationTime = try values.decodeIfPresent(String.self, forKey: .observationTime)
        max = try values.decodeIfPresent(MaxPrecipitation.self, forKey: .max)
    }
    
}

struct MaxPrecipitation : Codable {
    let value : Double?
    let units : String?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case units = "units"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(Double.self, forKey: .value)
        units = try values.decodeIfPresent(String.self, forKey: .units)
    }
    
}

struct PrecipitationProbability : Codable {
    let value : Int?
    let units : String?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case units = "units"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
        units = try values.decodeIfPresent(String.self, forKey: .units)
    }
    
}

struct ObservationTime : Codable {
    let value : String?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }
    
}
