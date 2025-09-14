//
//  ForecastModel.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 14.09.25.
//

import Foundation


// MARK: - Welcome
struct ForecastModel: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

struct Coord: Codable {
    let lat, lon: Double
}

struct List: Codable, Identifiable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let dtTxt: String

    var id: Int {dt}
    
    //Convert local date format (PM/AM) of API dtTxt object
    var hourPm: String{
        if let date = Self.inputFormatter.date(from: dtTxt){
            return Self.amPmFormatter.string(from: date)
        }
        return " "
    }
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather
        case dtTxt
    }
}

struct MainClass: Codable {
    let temp: Double
    
    var tempInt: Int{
        Int(temp)
    }
    
    enum CodingKeys: String, CodingKey {
        case temp
    }
}


struct Weather: Codable {
    let id: Int
    let icon: String
}


enum MainEnum: String, Codable {
    case clouds = "Clouds"
    case rain = "Rain"
}

extension List{
    private static var inputFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    private static var amPmFormatter: DateFormatter{
        let amPmFormatter = DateFormatter()
        amPmFormatter.locale = Locale(identifier: "en_US_POSIX")
        amPmFormatter.dateFormat = "h a"
        return amPmFormatter
    }
    
}
