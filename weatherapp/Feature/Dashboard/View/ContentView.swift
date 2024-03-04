//
//  WeatherDashboardView.swift
//  weatherapp
//
//  Created by Eashan on 28/2/24.
//

import SwiftUI
import Combine

struct WeatherDashboardView: View {
    
    @ObservedObject var presenter: WeatherPresenter
    
    var body: some View {
        VStack(spacing: 16){
            CurrentWeatherView(presenter: presenter)
            VerticalGridView(presenter: presenter)
                .padding(.horizontal, 20)
            WeatherDetailView(presenter: presenter)
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
        }
        .padding(.top, 40)
        .padding(.bottom, 40)
    }
}
