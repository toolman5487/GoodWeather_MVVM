//
//  File.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/6.
//

import Foundation

class WeatherListViewModel{
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel){
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int{
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel{
        return weatherViewModels[index]
    }
    
    func updateUnit(to unit: Unit){
        switch unit{
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenbeit()
        }
    }
    
    func toCelsius(){
        weatherViewModels = weatherViewModels.map{ vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5 / 9
            return weatherModel
        }
    }
    
    func toFahrenbeit(){
        weatherViewModels = weatherViewModels.map{ vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9 / 5) + 32
            return weatherModel
        }
    }
    
}

class WeatherViewModel{
    
    let weather:WeatherResponse
    var temperature:Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city:String{
        return weather.name
    }
    
}
