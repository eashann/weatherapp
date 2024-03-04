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
        ZStack {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 16){
                CurrentWeatherView(presenter: presenter)
                VerticalGridView(presenter: presenter)
                    .padding(.horizontal, 80)
                WeatherDetailView(presenter: presenter)
                    .padding(.horizontal, 100)
                    .padding(.vertical, 20)
            }
            .padding(.top, 40)
            .padding(.bottom, 40)
            .background(.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
        }
    }
}
