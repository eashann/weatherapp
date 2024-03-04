//
//  GridView.swift
//  weatherapp
//
//  Created by Eashan on 4/3/24.
//

import SwiftUI

struct GridView: View {
    
    var image: String
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.orange)
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.footnote)
                Text(subtitle)
                    .foregroundStyle(.white)
                    .font(.title2)
            }
        }
        .frame(width: 120, height: 50, alignment: .leading)
    }
}
