//
//  WeatherListTableViewController.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/6.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherViewModels = WeatherListViewModel()
    private var lastUnitSelection: Unit!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        userDefaultUnit()
    }

    func userDefaultUnit(){
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherViewModels.addWeatherViewModel(vm)
        print(vm)
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherViewModels.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let weatherVM = weatherViewModels.modelAt(indexPath.row)
        cell.configure(weatherVM)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }else if segue.identifier == "SettingTableViewController"{
            prepareSegueForSettingsTableViewController(segue: segue)
        }
    }
    
    func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation not Found")
        }
        guard let addWeatherCityVM = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not Found")
        }
        addWeatherCityVM.delegate = self
    }

    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation not Found")
        }
        guard let addWeatherCityVM = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not Found")
        }
        addWeatherCityVM.delegate = self
    }
}
extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherViewModels.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)
        }
    }
}
