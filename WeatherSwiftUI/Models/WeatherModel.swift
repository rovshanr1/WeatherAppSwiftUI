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
    let dt: Int
    let cod: Int
    let sys: Sys
    struct Coord: Codable {
        let lon, lat: Double
    }
    
    struct Sys: Codable{
        let country: String
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
        let pressure: Int?
        let humidity: Int?
        
        var temperatureString: String {
            String(format: "%.1f", temp)
        }
        
        var tempMaxString: String {
            String(format: "%.2f", tempMax)
        }
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike 
            case tempMin
            case tempMax
            case pressure
            case humidity
        }
        
    }
    
    struct Wind: Codable {
        let speed: Double
        let deg: Int
        let gust: Double?
    }
    
}
