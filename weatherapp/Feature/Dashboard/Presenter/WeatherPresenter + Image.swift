//
//  WeatherPresenter + Image.swift
//  weatherapp
//
//  Created by Eashan on 4/3/24.
//

import UIKit

enum Images {
    
    case feels
    case pressure
    case humidity
    case dewPoint
    case uvi
    case cloud
    case windSpeed
    case windDegree
    
    var imageName: String {
        switch self {
        case .feels:
            return "thermometer.snowflake"
        case .pressure:
            return "wind"
        case .humidity:
            return "humidity"
        case .dewPoint:
            return "cloud.snow"
        case .uvi:
            return "sun.max"
        case .cloud:
            return "cloud.circle"
        case .windSpeed:
            return "wind.snow"
        case .windDegree:
            return "wind.circle.fill"
        }
    }
    
    var getImage: UIImage {
        return UIImage(systemName: imageName) ?? UIImage()
    }
}
