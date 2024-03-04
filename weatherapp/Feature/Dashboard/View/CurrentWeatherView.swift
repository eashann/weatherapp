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
                .font(.title)
                .bold()
            
            Text(presenter.currentDate)
                .font(.subheadline)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.black)
                )
                .foregroundColor(Color.orange)
            
            Text(presenter.currentCondition)
                .font(.title2)
                .bold()
            
            Text("\(presenter.currentTemp)\u{00B0}")
                .font(.system(size: 150))
        }
    }
}
