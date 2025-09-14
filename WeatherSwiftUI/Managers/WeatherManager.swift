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
    
    let baseURL = "https://api.openweathermap.org/data/2.5"
    
    init(baseNetworkManager: NetworkService = BaseNetworkService()){
        self.baseNetworkManager = baseNetworkManager
    }
    
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherModel{
        let url = try buildURL(endpoint: "/weather", latitude: latitude, longitude: longitude)
        return try await baseNetworkManager.fetchData(from: url)
        
    }
    
    func fetchForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ForecastModel{
        let url = try buildURL(endpoint: "/forecast", latitude: latitude, longitude: longitude)
        return try await baseNetworkManager.fetchData(from: url)
    }
    
    private func buildURL(endpoint: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) throws -> URL{
        guard var components = URLComponents(string: baseURL + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric")
            
        ]
        
        guard let url = components.url else{
            throw NetworkError.invalidURL
        }
        
        return url
    }
    
}
