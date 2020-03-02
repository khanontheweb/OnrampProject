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
        print(urlString)
    }
}
