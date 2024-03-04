//
//  WeatherPresenter.swift
//  weatherapp
//
//  Created by Eashan on 29/2/24.
//

import Combine
import SwiftUI

struct DailyWeathers {
    let temp: String
    let condition: String
    let date: String
}

enum WeatherState {
    case loading, success, failed
}

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

class WeatherPresenter: ObservableObject {
    
    @Published private var weatherData: WeatherData?
    @Published private var weatherState: WeatherState? = .loading
    
    @Published var currentLocation: String = ""
    @Published var currentDate: String = ""
    @Published var currentCondition: String = ""
    @Published var currentTemp: String = ""
    @Published var currentFeel: String = ""
    @Published var currentPressure: String = ""
    @Published var currentHumidity: String = ""
    @Published var currentDewPoint: String = ""
    @Published var currentUVI: String = ""
    @Published var currentCloud: String = ""
    @Published var currentWindSpeed: String = ""
    @Published var currentWindDegree: String = ""
    @Published var image: Images = .feels
    @Published var dailyWeathers: [DailyWeathers] = []

    private let interactor: WeatherInteractor
    private var cancellable: AnyCancellable?
    
    @ObservedObject var locationManager = LocationManager.shared
    
    init(interactor: WeatherInteractor) {
        self.interactor = interactor
        fetchWeatherData(for: fetchCurrentLocation())
    }
    
    private func fetchCurrentLocation() -> Location {
        if let latitude = locationManager.currentLocation?.coordinate.latitude,
            let longitude = locationManager.currentLocation?.coordinate.longitude {
            print(longitude)
            return Location(latitude: latitude, longitude: longitude)
        } else {
            print("Location not available.")
        }
        
        return Location(latitude: 0.0, longitude: 0.0)
    }
    
    private func fetchWeatherData(for location: Location) {
        
        
        
        cancellable = interactor.fetchWeatherData(for: location)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] error in
                switch error {
                case .finished:
                    self?.weatherState = .loading
                case .failure:
                    self?.weatherState = .failed
                }
            }, receiveValue: { [weak self] weatherData in
                self?.weatherData = weatherData
                self?.weatherState = .success
                self?.setCurrentWeatherData()
            })
    }
    
    private func setCurrentWeatherData() {
        setCurrentLocation()
        setCurrentDate()
        setCurrentCondition()
        setCurrentTemp()
        setFeelsLikeTemp()
        setPressure()
        setHumidity()
        setDewPoint()
        setUVI()
        setClouds()
        setWindSpeed()
        setWindDegree()
        setHourlyWeather()
    }
    
    private func setCurrentLocation() {
        let currentLocation = weatherData?.timezone ?? ""
        let parts = currentLocation.components(separatedBy: "/")
        self.currentLocation = parts.last ?? ""
    }
    
    private func setCurrentDate() {
        
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE d, yyyy"
            return formatter
        }()
        
        let currentDate = Date()
        self.currentDate = dateFormatter.string(from: currentDate)
    }
    
    private func setCurrentCondition() {
        self.currentCondition = weatherData?.current?.weather?.first?.main ?? ""
    }
    
    private func setCurrentTemp() {
        let currentTemp = weatherData?.current?.temp?.stringValue() ?? ""
        self.currentTemp = currentTemp
    }
    
    private func setFeelsLikeTemp() {
        let feelLike = weatherData?.current?.feelsLike?.stringValue() ?? ""
        self.currentFeel = feelLike
    }
    
    private func setPressure() {
        let pressure = weatherData?.current?.pressure?.stringValue() ?? ""
        self.currentPressure = pressure
    }
    
    private func setHumidity() {
        let humidity = weatherData?.current?.humidity?.stringValue() ?? ""
        self.currentHumidity = humidity
    }
    
    private func setDewPoint() {
        let dewPoint = weatherData?.current?.dewPoint?.stringValue() ?? ""
        self.currentDewPoint = dewPoint
    }
    
    private func setUVI() {
        let uvi = weatherData?.current?.uvi?.stringValue() ?? ""
        self.currentUVI = uvi
    }
    
    private func setClouds() {
        let clouds = weatherData?.current?.clouds?.stringValue() ?? ""
        self.currentCloud = clouds
    }
    
    private func setWindSpeed() {
        let windSpeed = weatherData?.current?.windSpeed?.stringValue() ?? ""
        self.currentWindSpeed = windSpeed
    }
    
    private func setWindDegree() {
        let windDeg = weatherData?.current?.windDeg?.stringValue() ?? ""
        self.currentWindDegree = windDeg
    }
    
    private func setHourlyWeather() {
        
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return formatter
        }()
        
        let date = weatherData?.daily?.compactMap { $0.date }
        let condition = weatherData?.daily?.compactMap { $0.weather?.first?.main }
        let maxTemp = weatherData?.daily?.compactMap { $0.temp?.max }
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        date?.enumerated().forEach { index, date in
            
            let date = calendar.date(byAdding: .day, value: index, to: currentDate)
            let condition = condition?[index]
            let maxTemp = maxTemp?[index]
            
            let data = DailyWeathers(
                temp: maxTemp?.stringValue() ?? "0",
                condition: condition ?? "",
                date: dateFormatter.string(from: date ?? Date())
            )
            self.dailyWeathers.append(data)
        }
    }
}
