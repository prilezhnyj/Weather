//
//  CurrentWeatherModel.swift
//  Weather
//
//  Created by Максим Боталов on 16.06.2022.
//

import Foundation

struct CurrentWeatherModel {
    let nameCity: String
    let nameRegion: String
    
    let currentTemp: Double
    var currentTempString: String {
        return "\(currentTemp.rounded())"
    }
    
    let conditionCode: Int
    
    init?(currentWeatherData: CurrentWeatherData) {
        nameCity = currentWeatherData.location.name
        nameRegion = currentWeatherData.location.region
        currentTemp = currentWeatherData.current.tempC
        conditionCode = currentWeatherData.current.condition.code
    }
}
