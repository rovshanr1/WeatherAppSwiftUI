//
//  WeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 12.09.25.
//

import Foundation
import Combine

final class DateViewModel: ObservableObject {
    @Published var cityName: String = ""
    @Published var formattedDate: String = ""
    @Published var temperature: String = ""
    
    private let dateFormatter: DateFormatter
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
    }
    
    
    func update(with weather: WeatherModel) {
        cityName = weather.name
        formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.dt)))
        temperature = "\(Int(weather.main.temp))°C"
    }
}
