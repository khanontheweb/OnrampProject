//
//  WeatherModel.swift
//  OnrampProject
//
//  Created by Momo Khan on 3/2/20.
//

import Foundation

struct WeatherModel: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
