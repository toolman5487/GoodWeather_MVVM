//
//  WeatherCell.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/6.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    
    
    func configure(_ vm: WeatherViewModel){
        self.cityNameLabel.text = vm.city
        self.cityNameLabel.textColor = .orange
        self.temperatureLabel.text = "\(vm.temperature.formatAsDegree())"
        self.temperatureLabel.textColor = .orange
    }
    
    
}
