//
//  LocationPermissionView.swift
//  weatherapp
//
//  Created by Eashan on 4/3/24.
//

import SwiftUI

struct LocationPermissionView: View {
    
    @StateObject var locationManager = LocationManager.shared
    @State private var authorizationStatus: Bool = false
    
    var body: some View {
        VStack {
            Text("To provide you with accurate weather updates, we need access to your current location.")
                .font(.headline)
                .multilineTextAlignment(.center)
            Button(action: {
                locationManager.requestLocationPermission()
                if locationManager.authorizationStatus == .authorizedWhenInUse ||
                    locationManager.authorizationStatus == .authorizedAlways {
                    authorizationStatus = true
                }
            }, label: {
                Text("Grant Location Permission")
                    .padding(10)
                    .bold()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(32)
            })
        }
        .sheet(isPresented: $authorizationStatus) { RootView() }
    }
}
