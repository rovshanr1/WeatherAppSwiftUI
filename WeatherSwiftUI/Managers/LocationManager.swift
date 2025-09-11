//
//  WeatherVM.swift
//  WeatherSwiftUI
//
//  Created by Rovshan Rasulov on 11.09.25.
//

import Combine
import CoreLocation


final class LocationManager: NSObject, ObservableObject,CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first?.coordinate else { return }
        self.location = location
        isLoading = false
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.errorMessage = LocatinError.errorGettingLocation.localizedDescription
        isLoading = false
    }
}


