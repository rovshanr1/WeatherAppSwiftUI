//
//  WeatherView.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 08.09.25.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var formatter = FormatterManager()
    var weather: WeatherModel
    var forecast: ForecastModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 16) {
                Text("\(weather.formatedDate)")
                    .font(.footnote)
                Text("\(formatter.cityName)")
                    .font(.system(.subheadline, weight: .bold))
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack{
                        Text("\(formatter.temperature)")
                            .font(.system(size: 86, weight: .bold))
                        Text("°C")
                            .font(.system(size: 26))
                            .offset(y: 18)
                        
                        Spacer()
                        
                        VStack{
                            Text("↑\(formatter.temperatureMax)°C")
                                .padding(.bottom)
                            Text("↓\(formatter.temperatureMin)°C")
                        }
                    }
                    Capsule()
                        .frame(height: 6)
                    Text("\(weather.weather[0].main)")
                        .font(.system(size: 24, weight: .light))
                }
                .padding(.bottom)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(){
                        ForEach(forecast.list) { entry in
                            VStack{
                                Text("\(entry.main.tempInt)")
                                    .font(.title2)
                                
                                
                                Image(systemName: weatherIcon(from: entry.weather[0].icon))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 26, height: 26)
                                
                                Text("\(entry.hourPm)".lowercased())
                                    .font(.title3)
                                    
                            }
                        }
                    }
                   
                }
                
                
               
            }
            .padding()
            .background{
                BackgroundGlowView(weatherCondition: weather)
            }
            .preferredColorScheme(.light)
            .task{
               await formatter.updateWeather(with: weather)
            }
        }
        
    }
}




#Preview {
    WeatherView(weather: pereviewWeather, forecast: pereviewForecast)
}


