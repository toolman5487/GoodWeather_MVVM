//
//  WeatherResponse.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/6.
//

import Foundation

struct WeatherResponse: Codable{
    
    let main: Weather
}

struct Weather: Codable{
    
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Double
    let pressure: Double
    let sea_level: Double
    let grnd_level: Double
}
