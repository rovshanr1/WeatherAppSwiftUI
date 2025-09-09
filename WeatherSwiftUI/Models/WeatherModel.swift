//
//  WeatherModel.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 09.09.25.
//

import Foundation

struct WeatherModel: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let id: Int
    let name: String
    let cod: Int
    
    struct Coord: Codable {
        let lon, lat: Double
    }
    
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    
    struct Clouds: Codable {
        let all: Int
    }
    
    struct Main: Codable {
        let temp: Double
        let feelsLike: Double
        let tempMin: Double
        let tempMax: Double
        let pressure: Int
        let humidity: Int
        
        var temperatureString: String {
            String(format: "%.1f", temp)
        }
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin   = "temp_min"
            case tempMax   = "temp_max"
            case pressure
            case humidity
        }
        
    }
    
    
    
    struct Wind: Codable {
        let speed: Double
        let deg: Int
        let gust: Double
    }
    
}




