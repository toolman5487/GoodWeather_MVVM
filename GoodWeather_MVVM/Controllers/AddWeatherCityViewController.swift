//
//  AddWeatherCityViewController.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/6.
//

import Foundation
import UIKit

class AddWeatherCityViewController:UIViewController{
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed(_ sender: Any) {
        
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?&appid=37a9a30bf0bea09f0dd564539813d064&q=\(city)&units=imperial)")!
            
            let weeatherResource = Resource<Any>(url: weatherURL){ data in
                return data
            }
            
            Webservice().load(resource: weeatherResource){ result in
                
                
            }
            
        }
        
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
