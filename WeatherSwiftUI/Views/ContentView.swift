//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 12.09.25.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: WeatherModel?
    @State var forecast: ForecastModel?
    
    
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if let weather = weather, let forecast = forecast  {
                    WeatherView(weather: weather, forecast: forecast)
                }else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.fetchWeather(latitude: location.latitude, longitude: location.longitude)
                                print("✅ Current Weather data loaded: \(weather?.name ?? "N/A")")
                                forecast = try await weatherManager.fetchForecast(latitude: location.latitude, longitude: location.longitude)
                            } catch let error as DecodingError{
                                print("decoding error: \(error)")
                            }catch{
                                print("Error: \(error)")
                                fatalError(locationManager.errorMessage!)
                            }
                        }
                }
            }else{
                if locationManager.isLoading {
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManager)
                    
                }
            }
        }
    }
}


//#Preview {
//    ContentView()
//}
