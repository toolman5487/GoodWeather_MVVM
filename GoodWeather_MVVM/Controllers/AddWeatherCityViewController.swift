//
//  AddWeatherCityViewController.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/6.
//

import Foundation
import UIKit

protocol AddWeatherDelegate{
    func addWeatherDidSave(vm:WeatherViewModel)
}

class AddWeatherCityViewController:UIViewController{
    
    private var addWeatherVM = AddWeatherViewModel()
    var delegate:AddWeatherDelegate?
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed(_ sender: Any) {
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city){ vm in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
