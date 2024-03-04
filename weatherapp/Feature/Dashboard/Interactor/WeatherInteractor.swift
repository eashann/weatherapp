//
//  WeatherInteractor.swift
//  weatherapp
//
//  Created by Eashan on 29/2/24.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidResponse
    case networkError(Error)
}

class WeatherInteractor {
    
    private let service: WeatherService
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func fetchWeatherData(for location: Location) -> AnyPublisher<WeatherData, APIError> {
        return service.fetchWeather(for: location)
    }
}
