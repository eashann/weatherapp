//
//  VerticalGridView.swift
//  weatherapp
//
//  Created by Eashan on 4/3/24.
//

import SwiftUI

struct VerticalGridView: View {
    
    @ObservedObject var presenter: WeatherPresenter
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(presenter.dailyWeathers, id: \.date) { item in
                    VStack(spacing: 0) {
                        Text(item.date)
                        Text("\(item.temp)\u{00B0}")
                            .bold()
                        Text(item.condition)
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
}
