//
//  RBWeatherDemoApp.swift
//  RBWeatherDemo
//
//  Created by Ritik on 15/04/23.
//

import SwiftUI

@main
struct RBWeatherDemoApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView( timeOfDay: .day)
        }
    }
}
