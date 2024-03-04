//
//  weatherappTests.swift
//  weatherappTests
//
//  Created by Eashan on 4/3/24.
//

import Combine
import XCTest
@testable import weatherapp

class weatherappTests: XCTestCase {
    
    var presenter: WeatherPresenter!
    var mockInteractor: MockWeatherInteractor!
    var mockService: WeatherService!
    
    override func setUp() {
        super.setUp()
        mockInteractor = MockWeatherInteractor(service: mockService)
        presenter = WeatherPresenter(interactor: mockInteractor)
    }
    
    override func tearDown() {
        presenter = nil
        mockInteractor = nil
        super.tearDown()
    }
    
    func testFetchWeatherData() {
        // Given
        let location = Location(latitude: 0.0, longitude: 0.0)
        
        // When
        //        presenter.fetchWeatherData(for: location)
        
        // Then
        XCTAssertTrue(mockInteractor.fetchWeatherDataCalled)
    }
    
    func testSetCurrentWeatherData() {
        // Given
        //        let weatherData = WeatherData()
        
        // When
        //        presenter.setCurrentWeatherData()
        
        // Then
        //        XCTAssertEqual(presenter.currentLocation, weatherData.timezone)
        // Test other properties as well
    }
    
    // Add more tests for other methods as needed
}

// Mock WeatherInteractor for testing purposes
class MockWeatherInteractor: WeatherInteractor {
    
    var fetchWeatherDataCalled = false
    
    func fetchWeatherData(for location: Location) -> AnyPublisher<WeatherData, Error> {
        fetchWeatherDataCalled = true
        return Empty().eraseToAnyPublisher()
    }
}
