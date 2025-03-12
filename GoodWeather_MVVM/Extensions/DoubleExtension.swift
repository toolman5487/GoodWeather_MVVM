//
//  File.swift
//  GoodWeather_MVVM
//
//  Created by Willy Hsu on 2025/3/10.
//

import Foundation

extension Double{
    func formatAsDegree() -> String{
       return String(format: "%.0f°", self)
    }
}
