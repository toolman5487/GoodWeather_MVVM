//
//  WeatherListTableViewController.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/6.
//

import Foundation
import UIKit

class WeatherListTableViewController:UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
       /* let resource = Resource<WeatherResponse>(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?&appid=37a9a30bf0bea09f0dd564539813d064&q=taiwan")!){ data in
            
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
        }
        Webservice().load(resource: resource){ weatherResponse in
            
            if let weatherResponse = weatherResponse{
                print(weatherResponse)
            }
        }*/
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.cityNameLabel.text = "Taipei"
        cell.temperatureLabel.text = "25°C"

        
        return cell
    }
    
}
