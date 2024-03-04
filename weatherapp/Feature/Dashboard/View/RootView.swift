//
//  RootView.swift
//  weatherapp
//
//  Created by Eashan on 4/3/24.
//

import SwiftUI

struct RootView: View {
    
    let interactor = WeatherInteractor(service: WeatherService())
    let presenter: WeatherPresenter
    
    init() {
        presenter = WeatherPresenter(interactor: interactor)
    }
    
    var body: some View {
        WeatherDashboardView(presenter: presenter)
    }
}

