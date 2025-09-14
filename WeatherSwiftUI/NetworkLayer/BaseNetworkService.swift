//
//  BaseNetworkService.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 09.09.25.
//

import Foundation

protocol NetworkService{
    func fetchData<T: Decodable>(from url: URL) async throws -> T
}

class BaseNetworkService: NetworkService{
    func fetchData<T>(from url: URL) async throws -> T where T: Decodable {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            if httpResponse.statusCode == 404 {
                throw NetworkError.notFound
            }
            throw NetworkError.invalidResponse
        }
      
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        }catch let error as DecodingError{
            print("decoding error: \(error)")
            throw error 
        } catch{
            print("Decoding faild", error)
            throw NetworkError.decodingError(error)
        }
     }
}
