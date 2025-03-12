//
//  SettingsViewModel.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/10.
//

import Foundation

enum Unit: String, CaseIterable{
    
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit{
    var displayName: String{
        get {
            switch self{
                case .celsius:
                return "攝氏溫度"
            case .fahrenheit:
                return "華氏溫度"
            }
        }
    }
    
}

/*class SettingsViewModel{
    
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String{
                unitValue = value
            }
            print("unitValue = \(unitValue)")
            return Unit(rawValue: unitValue)!
        }
        
        set{
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}*/
class SettingsViewModel {
    
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            // 如果沒有儲存過，就預設為 "metric"
            let unitValue = userDefaults.string(forKey: "unit") ?? "metric"
            // 如果 unitValue 不是有效值，就回傳 .celsius 預設
            return Unit(rawValue: unitValue) ?? .celsius
        }
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
