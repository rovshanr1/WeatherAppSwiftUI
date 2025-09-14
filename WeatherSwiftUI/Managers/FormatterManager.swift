//
//  FormatterManager.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 12.09.25.
//

import Foundation
import Combine

final class FormatterManager: ObservableObject {
    @Published var cityName: String = ""
    @Published var formattedDate: String = ""
    @Published var temperature: String = ""
    @Published var temperatureMax: String = ""
    @Published var temperatureMin: String = ""
    @Published var forecastTemperature: String = ""
    @Published var formatedAM: String = ""
    
    private let dateFormatter: DateFormatter
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
    }
    
    
    func updateWeather(with weather: WeatherModel) async {
        cityName = weather.name
        formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.dt)))
        temperature = "\(Int(weather.main.temp))"
        temperatureMax = "\(Int(weather.main.tempMax))"
        temperatureMin = "\(Int(weather.main.tempMin))"
    }
}
