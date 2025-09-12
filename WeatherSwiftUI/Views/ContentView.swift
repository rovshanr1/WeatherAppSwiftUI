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
    
    
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if let weather = weather {
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.fetchWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch{
                                print(error.localizedDescription)
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
        .background(Color(red: 0.13,green: 0.12,blue: 0.31))
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}
