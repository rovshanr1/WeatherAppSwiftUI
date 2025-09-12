//
//  BackgroundGlowView.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 12.09.25.
//

import SwiftUI


struct BackgroundGlowView: View {
    var body: some View {
        Image("SunnyBackground")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 696)
            .offset(y: -140)
    }
}
