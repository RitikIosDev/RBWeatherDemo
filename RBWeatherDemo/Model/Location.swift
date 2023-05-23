//
//  Location.swift
//  RBWeatherDemo
//
//  Created by Ritik on 15/04/23.
//

import Foundation

struct Location: Identifiable, Hashable {
    
    static let preview = Location(locationName: "City", weather: "Cloudy", weatherImage: "", wind: 23, humidity: 45, feelsLike: 12, uvIndex: 89, dayTemperature: 26, eveningTemperature: 24, nightTemperature: 20)
    
    let id = UUID()
    let locationName: String
    let weather: String
    let weatherImage: String
    let wind: Int
    let humidity: Int
    let feelsLike: Int
    let uvIndex: Int
    let dayTemperature: Int
    let eveningTemperature: Int
    let nightTemperature: Int
}

    
