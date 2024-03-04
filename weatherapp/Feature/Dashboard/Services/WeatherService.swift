//
//  WeatherService.swift
//  weatherapp
//
//  Created by Eashan on 29/2/24.
//

import Combine
import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(for location: Location) -> AnyPublisher<WeatherData, APIError>
}

class WeatherService: WeatherServiceProtocol {
    
    func fetchWeather(for location: Location) -> AnyPublisher<WeatherData, APIError> {
        
        let request = WeatherAPIRouter.currentWeather(location: location).urlRequest
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .mapError { error in
                APIError.networkError(error)
            }
            .eraseToAnyPublisher()
    }
}
