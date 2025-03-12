//
//  SettingTableViewController.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/10.
//

import Foundation
import UIKit

protocol SettingsDelegate{
    func settingsDone(vm: SettingsViewModel)
}

class SettingTableViewController:UITableViewController {
    
    private var settingViewModel = SettingsViewModel()
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func doneBtn(){
        if let delegate = self.delegate{
            delegate.settingsDone(vm: settingViewModel)
        }
        
        self.dismiss(animated: true,completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingViewModel.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == settingViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
}
