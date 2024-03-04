//
//  weatherappApp.swift
//  weatherapp
//
//  Created by Eashan on 28/2/24.
//

import SwiftUI

@main
struct weatherappApp: App {
    
    @StateObject var locationManager = LocationManager.shared
    
    var body: some Scene {
        WindowGroup {
            if locationManager.currentLocation != nil {
                RootView()
            } else {
                LocationPermissionView()
            }
        }
    }
}
