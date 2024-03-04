//
//  WeatherDetailView.swift
//  weatherapp
//
//  Created by Eashan on 4/3/24.
//

import SwiftUI

struct WeatherDetailView: View {
    
    @ObservedObject var presenter: WeatherPresenter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack {
                GridView(
                    image: Images.feels.imageName,
                    title: "Feels Like",
                    subtitle: presenter.currentFeel
                )
                Spacer()
                GridView(
                    image: Images.pressure.imageName,
                    title: "Pressure",
                    subtitle: presenter.currentPressure
                )
            }
            
            HStack {
                GridView(
                    image: Images.humidity.imageName,
                    title: "Humidity",
                    subtitle: presenter.currentHumidity
                )
                Spacer()
                GridView(
                    image: Images.dewPoint.imageName,
                    title: "Dew Point",
                    subtitle: presenter.currentDewPoint
                )
            }
            
            HStack {
                GridView(
                    image: Images.uvi.imageName,
                    title: "UVI",
                    subtitle: presenter.currentUVI
                )
                Spacer()
                GridView(
                    image: Images.windSpeed.imageName,
                    title: "Wind Speed",
                    subtitle: presenter.currentWindSpeed
                )
            }
        }
    }
}
