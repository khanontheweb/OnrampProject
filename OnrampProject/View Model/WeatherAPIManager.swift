//
//  WeatherAPIManager.swift
//  OnrampProject
//
//  Created by Momo Khan on 3/2/20.
//

import Foundation

protocol WeatherAPIManagerDelegate {
    func didUpdateWeather(_ weatherAPIManager: WeatherAPIManager, weather: WeatherViewModel)
    
    func didFailWithError(error: Error)
}

struct WeatherAPIManager {
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=\(openWeatherKey)&units=imperial"
    
    var delegate: WeatherAPIManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(url)&q=\(cityName)"
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let validData = data {
                    if let weather = self.parseJSON(validData) {
                        print(weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func parseJSON(_ weatherData: Data) -> WeatherViewModel? {
        let decoder = JSONDecoder()
        do {
            let weatherModel = try decoder.decode(WeatherModel.self, from: weatherData)
            let weatherViewModel = WeatherViewModel(conditionId: weatherModel.weather[0].id, cityName: weatherModel.name, temperature: weatherModel.main.temp)
            return weatherViewModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
    
    
}
