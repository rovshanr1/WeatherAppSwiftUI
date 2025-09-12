//
//  LoadingView.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 13.09.25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
