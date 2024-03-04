//
//  LocationManager.swift
//  weatherapp
//
//  Created by Eashan on 4/3/24.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    static let shared = LocationManager()
    
    private var locationManager: CLLocationManager
    
    @Published var currentLocation: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    private override init() {
        self.locationManager = CLLocationManager()
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }
    
    func requestLocationPermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorizationStatus = status
    }
}
