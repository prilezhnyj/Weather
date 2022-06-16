//
//  CityModel.swift
//  Weather
//
//  Created by Максим Боталов on 16.06.2022.
//

import Foundation

struct CityModel: Codable, Hashable {
    
    let city: [City]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(city.first?.cityID)
    }
    
    static func == (lhs: CityModel, rhs: CityModel) -> Bool {
        return lhs.city.first?.cityID == rhs.city.first?.cityID
    }
}

struct City: Codable {
    let cityID, countryID, regionID, name: String

    enum CodingKeys: String, CodingKey {
        case cityID = "city_id"
        case countryID = "country_id"
        case regionID = "region_id"
        case name
    }
}

