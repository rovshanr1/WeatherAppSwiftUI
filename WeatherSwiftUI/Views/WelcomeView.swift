//
//  WelcomeView.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 12.09.25.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Wellcome to the Weather App")
                    .bold()
                    .font(.title)
                    .foregroundStyle(.white)
                
                Text("Please share yout current location to get weather in your area"
                    )
                .foregroundStyle(.white)
                .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.13,green: 0.12,blue: 0.31))
    }
}

#Preview {
    WelcomeView()
        .environmentObject(LocationManager())
}
