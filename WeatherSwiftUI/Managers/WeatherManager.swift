//
//  WeatherManager.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 10.09.25.
//

import Foundation
import CoreLocation

final class WeatherManager {
    let baseNetworkManager: NetworkService
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
    
    init(baseNetworkManager: NetworkService = BaseNetworkService()){
        self.baseNetworkManager = baseNetworkManager
    }
    
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherModel{
        guard var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather") else {
            throw NetworkError.invalidURL
        }
        
        components.queryItems = [
        URLQueryItem(name: "lat", value: "\(latitude)"),
        URLQueryItem(name: "lon", value: "\(longitude)"),
        URLQueryItem(name: "appid", value: apiKey),
        URLQueryItem(name: "units", value: "metric")
        
        ]
         
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        let (_, response) = try await URLSession.shared.data(from: url)
        if let httpResponse = response as? HTTPURLResponse {
            print("HTTP status code:", httpResponse.statusCode)
        }
        print(components.url!)
        
        return try await baseNetworkManager.fetchData(from: url)
    }
}
