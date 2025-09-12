//
//  WeatherView.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 08.09.25.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var dateVM = DateViewModel()
    var weather: WeatherModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Text("11:30 am, Fri Jan 4")
                    .font(.footnote)
                Text("Sydney. NSW")
                    .font(.system(.subheadline, weight: .bold))
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack{
                        Text("28")
                            .font(.system(size: 86, weight: .bold))
                        Text("°C")
                            .font(.system(size: 26))
                            .offset(y: 18)
                        
                        Spacer()
                        
                        VStack{
                            Text("↑32°C")
                                .padding(.bottom)
                            Text("↓18°C")
                        }
                    }
                    Capsule()
                        .frame(height: 6)
                    Text("Clear and sunny")
                        .font(.system(size: 24, weight: .light))
                }
               
            }
            .padding()
            .background{
                BackgroundGlowView()
            }
            
        }
        
    }
}




#Preview {
    WeatherView(weather: pereviewWeather)
}

var pereviewWeather: WeatherModel = load("weatherData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
