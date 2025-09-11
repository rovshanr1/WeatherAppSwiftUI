//
//  NetworkError.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 09.09.25.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case decodingError(Error)
    case noInternetConnection
    case misingAPIKey
    case invalidResponse
    case notFound
    case unowned(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .decodingError:
            return "Error processing data"
        case .noInternetConnection:
            return "No internet connection"
        case .misingAPIKey:
            return "API key not found"
        case .notFound:
            return "URL session failed"
        case .unowned(let error):
            return error.localizedDescription
        }
    }
}

enum LocatinError: LocalizedError {
    case denied
    case restricted
    case unavailable
    case errorGettingLocation
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .denied:
            return "Location access denied"
        case .restricted:
            return "Location access restricted"
        case .unavailable:
            return "Location unavailable"
        case .unknown(let error):
            return error.localizedDescription
        case .errorGettingLocation:
            return "Error getting location"
        }
    }
}
