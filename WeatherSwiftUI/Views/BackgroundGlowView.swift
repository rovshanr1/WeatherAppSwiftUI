//
//  BackgroundGlowView.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 12.09.25.
//

import SwiftUI


struct BackgroundGlowView: View {
    var weatherCondition: WeatherModel
    
    var body: some View {
        switch weatherCondition.weather[0].id {
        case 800:
            return  Image("SunnyBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 696)
                .offset(y: -140)
        case 801...804:
            return  Image("BackgroundGlow2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 696)
                .offset(y: -140)
        default:
            return Image("BackgroundGlow2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 696)
                .offset(y: -140)
        }
    }
    
    
}
