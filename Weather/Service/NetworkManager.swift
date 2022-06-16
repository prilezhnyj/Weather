//
//  NetworkManager.swift
//  Weather
//
//  Created by Максим Боталов on 15.06.2022.
//

import Foundation

struct NetworkManager {
    
    func fetchCurrentWeather(forCity city: String, completion: @escaping (CurrentWeatherModel) -> Void) {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=yes"
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url!) { data, response, error in
            if let data = data {
                guard let currentWeather = self.parseJSON(withData: data) else { return }
                completion(currentWeather)
            } else {
                print(error?.localizedDescription as Any)
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> CurrentWeatherModel? {
        do {
            let currentWeatherData = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
            guard let currentWeatherModel = CurrentWeatherModel(currentWeatherData: currentWeatherData) else { return nil }
            print(currentWeatherData.location.region)
            return currentWeatherModel
        } catch let error as NSError {
            print(String(describing: error))
        }
        return nil
    }
}


