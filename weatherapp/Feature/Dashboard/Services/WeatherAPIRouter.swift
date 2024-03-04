//
//  WeatherAPIRouter.swift
//  weatherapp
//
//  Created by Eashan on 2/3/24.
//

import Foundation

enum WeatherAPIRouter {
    
    // Instead, store them in your codebase. Common methods include environment variables, key management services, or configuration files that are not checked into version control.
    private static let apiKey = "111f0273c10bd521fb13ef78e55fbb60"
    
    case currentWeather(location: Location)
    
    private var baseURL: String {
        switch self {
        default:
            return "https://api.openweathermap.org/data/3.0"
        }
    }
    
    private var apiKeyQueryItem: URLQueryItem {
        return URLQueryItem(name: "appid", value: WeatherAPIRouter.apiKey)
    }
    
    private var unitsQueryItem: URLQueryItem {
        return URLQueryItem(name: "units", value: "metric")
    }
    
    private var languageQueryItem: URLQueryItem {
        return URLQueryItem(name: "lang", value: "en")
    }
    
    private var excludeQueryItem: URLQueryItem {
        return URLQueryItem(name: "exclude", value: "minutely")
    }
    
    private var path: String {
        switch self {
        case .currentWeather:
            return "/onecall"
        }
    }
    
    private var parameters: [URLQueryItem] {
        switch self {
        case .currentWeather(let location):
            let latQueryItem = URLQueryItem(name: "lat", value: "\(location.latitude)")
            let lonQueryItem = URLQueryItem(name: "lon", value: "\(location.longitude)")
            return [
                latQueryItem,
                lonQueryItem,
                unitsQueryItem,
                languageQueryItem,
                apiKeyQueryItem
            ]
        }
    }
    
    var urlRequest: URLRequest {
        var components = URLComponents(string: baseURL + path)!
        components.queryItems = parameters
        let url = components.url!
        return URLRequest(url: url)
    }
}
