//
//  CurrentWeatherView.swift
//  weatherapp
//
//  Created by Eashan on 2/3/24.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @ObservedObject var presenter: WeatherPresenter
    
    var body: some View {
        VStack(spacing: 8) {
            Text(presenter.currentLocation)
                .foregroundStyle(.white)
                .font(.title)
                .bold()
            
            Text(presenter.currentDate)
                .font(.subheadline)
                .bold()
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.orange)
                )
                .foregroundColor(.white)
            
            Text(presenter.currentCondition)
                .foregroundStyle(.white)
                .font(.title2)
                .bold()
            
            Text("\(presenter.currentTemp)\u{00B0}")
                .foregroundStyle(.white)
                .font(.system(size: 150))
        }
    }
}
