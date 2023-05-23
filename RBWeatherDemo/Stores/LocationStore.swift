//
//  PlaneStore.swift
//  PlaneSpotterDemo
//
//  Created by Ritik on 10/04/23.
//

import SwiftUI

class LocationStore: ObservableObject {
    
    @Published var locations: [Location] = []

    
    init() {
        let location1 = Location(locationName: "New York", weather: "Cloudy", weatherImage: "cloudy", wind: 5, humidity: 80, feelsLike: 20, uvIndex: 3, dayTemperature: 22, eveningTemperature: 18, nightTemperature: 15)
        locations.append(location1)

        let location2 = Location(locationName: "San Francisco", weather: "Sunny", weatherImage: "sunny", wind: 10, humidity: 60, feelsLike: 25, uvIndex: 7, dayTemperature: 25, eveningTemperature: 20, nightTemperature: 18)
        locations.append(location2)

        let location3 = Location(locationName: "London", weather: "Rainy", weatherImage: "rainy", wind: 7, humidity: 90, feelsLike: 15, uvIndex: 2, dayTemperature: 18, eveningTemperature: 16, nightTemperature: 12)
        locations.append(location3)
    }
}
