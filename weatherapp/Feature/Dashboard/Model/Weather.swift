//
//  Weather.swift
//  weatherapp
//
//  Created by Eashan on 29/2/24.
//

import Foundation

struct WeatherData: Codable {
    let latitude: Double?
    let longitude: Double?
    let timezone: String?
    let current: CurrentWeather?
    let daily: [DailyWeather]?
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case timezone
        case current
        case daily
    }
}

struct CurrentWeather: Codable {
    let sunrise: Double?
    let sunset: Double?
    let temp: Double?
    let feelsLike: Double?
    let pressure: Double?
    let humidity: Double?
    let dewPoint: Double?
    let uvi: Double?
    let clouds: Double?
    let visibility: Double?
    let windSpeed: Double?
    let windDeg: Double?
    let weather: [WeatherDetail]?
    
    private enum CodingKeys: String, CodingKey {
        case sunrise, sunset
        case temp, pressure, humidity, uvi, clouds, visibility, weather
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
    }
}

struct DailyWeather: Codable {
    
    let date: Double?
    let temp: TemperatureDetail?
    let weather: [WeatherDetail]?
    
    private enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temp
        case weather
    }
}

struct WeatherDetail: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct TemperatureDetail: Codable {
    let day: Double?
    let min: Double?
    let max: Double?
    let night: Double?
    let eve: Double
    let morn: Double?
}

struct Location {
    let latitude: Double
    let longitude: Double
}

struct DailyWeathers {
    let temp: String
    let condition: String
    let date: String
}

enum WeatherState {
    case loading, success, failed
}
