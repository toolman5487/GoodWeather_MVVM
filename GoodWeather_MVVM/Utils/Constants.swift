//
//  Constants.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/6.
//

import Foundation

struct Constants{
    
    struct Urls{
        static func urlForWeatherBycity(city: String)-> URL{
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?units=imperial&appid=37a9a30bf0bea09f0dd564539813d064&q=\(city.escaped())")!
        }
    }
}
