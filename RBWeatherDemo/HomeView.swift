//
//  ContentView.swift
//  RBWeatherDemo
//
//  Created by Ritik on 15/04/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var backgroundImage = UIImage()
    @State private var currentForegroundColor = Color.white
    @State private var timeOfDay: TimeOfDay = .day
    @State private var weatherImage = UIImage()
    @State private var show: Bool = false
    @State var selectedLocation: Location = Location(locationName: "location", weather: "weather", weatherImage: "", wind: 0, humidity: 0, feelsLike: 0, uvIndex: 0, dayTemperature: 0, eveningTemperature: 0, nightTemperature: 0)
    
    @ObservedObject var store = LocationStore()
    enum TimeOfDay: CaseIterable {
        case day, evening, night
    }
    
    public init(backgroundImage: UIImage = UIImage(), currentForegroundColor: SwiftUI.Color = Color.white, timeOfDay: TimeOfDay, weatherImage: UIImage = UIImage(), show: Bool = false, store: LocationStore = LocationStore()) {
        self.backgroundImage = backgroundImage
        self.currentForegroundColor = currentForegroundColor
        self.timeOfDay = timeOfDay
        self.weatherImage = weatherImage
        self.show = show
        self.store = store
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image(uiImage: getBackgroundImage())
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    VStack (spacing: 10){
                        HStack {
                            Text("Today," + getTodaysDate())
                                .font(.system(size: 18, weight: .bold))
                            
                            Spacer()
                        }
                        HStack {
                            Menu {
                                ForEach(store.locations, id: \.self) { location in
                                    if let locationName = location.locationName {
                                        Button(action: {
                                            selectedLocation = location
                                        }) {
                                            Label(locationName, image: "")
                                        }
                                    }
                                }
                            } label: {
                                HStack {
                                    Label(selectedLocation.locationName, systemImage: "safari.fill")
                                        .font(.system(size: 16, weight: .medium))
                                    Image(systemName: "chevron.down.circle")
                                        .font(.system(size: 12, weight: .medium))
                                    Spacer()
                                }
                                .frame(width: 300)
                            }
                            Spacer()
                        }
                    }.padding(.top)
                    VStack (spacing: 10){
                        HStack (alignment: .top){
                            Text("\(selectedLocation.dayTemperature)")
                                .font(.system(size: 120, weight: .semibold))
                            Text("°C")
                                .font(.system(size: 50, weight: .semibold))
                            Spacer()
                        }
                        HStack {
                            Image(systemName: getWeatherImage())
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.yellow)
                            Text("Cloudy")
                                .font(.system(size: 20, weight: .semibold))
                            Spacer()
                        }
                    }
                    .padding(.top)
                    Spacer()
                    ZStack {
                        if timeOfDay == .day {
                            Color.black
                                .opacity(0.5)
                        } else {
                            Color.white
                                .opacity(0.5)
                        }
                        VStack {
                            HStack {
//                                Spacer()
                                VStack {
//                                    Spacer()
                                    Image(systemName: "wind")
                                        .font(.system(size: 20, weight: .semibold))
//                                    Spacer()
                                    Text("Wind (km/h)")
                                        .font(.system(size: 11, weight: .semibold))
//                                    Spacer()
                                    Text("\(selectedLocation.wind)")
                                        .font(.system(size: 24, weight: .semibold))
//                                    Spacer()
                                }
//                                Divider()
//                                    .frame(width: 1, height: 80)
//                                    .overlay(.white)
                                VStack {
//                                    Spacer()
                                    Image(systemName: "humidity")
                                        .font(.system(size: 20, weight: .semibold))
//                                    Spacer()
                                    Text("Humidity (%)")
                                        .font(.system(size: 11, weight: .semibold))
//                                    Spacer()
                                    Text("\(selectedLocation.humidity)")
                                        .font(.system(size: 24, weight: .semibold))
//                                    Spacer()
                                }
//                                Divider()
//                                    .frame(width: 1, height: 80)
//                                    .overlay(.white)
                                VStack {
//                                    Spacer()
                                    Image(systemName: "thermometer.medium")
                                        .font(.system(size: 20, weight: .semibold))
//                                    Spacer()
                                    Text("Feels Like")
                                        .font(.system(size: 11, weight: .semibold))
//                                    Spacer()
                                    Text("\(selectedLocation.feelsLike)")
                                        .font(.system(size: 24, weight: .semibold))
//                                    Spacer()
                                }
//                                Divider()
//                                    .frame(width: 1, height: 80)
//                                    .overlay(.white)
                                VStack {
//                                    Spacer()
                                    Image(systemName: "sun.min.fill")
                                        .font(.system(size: 20, weight: .semibold))
//                                    Spacer()
                                    Text("UV Index")
                                        .font(.system(size: 11, weight: .semibold))
//                                    Spacer()
                                    Text("\(selectedLocation.uvIndex)")
                                        .font(.system(size: 24, weight: .semibold))
//                                    Spacer()
                                }
//                                Spacer()
                            }
                            Divider()
                                .frame(height: 1)
                                .overlay(.white)
                            
                            HStack {
                                VStack (alignment: .center, spacing: 8){
                                    Image(systemName: "sun.max.fill")
                                        .font(.system(size: 40, weight: .semibold))
                                        .foregroundColor(.yellow)
                                    Text("Day")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("\(selectedLocation.dayTemperature)" + "°")
                                        .font(.system(size: 26, weight: .regular))
                                        .offset(x: 5)
                                }.padding(.leading)
                                Spacer()
                                VStack (alignment: .center, spacing: 8){
                                    Image(systemName: "cloud.sun.fill")
                                        .font(.system(size: 40, weight: .semibold))
                                        .foregroundColor(.orange)
                                    Text("Evening")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("\(selectedLocation.eveningTemperature)" + "°")
                                        .font(.system(size: 26, weight: .regular))
                                        .offset(x: 5)
                                    
                                }
                                Spacer()
                                VStack (alignment: .center, spacing: 8){
                                    Image(systemName: "moon.fill")
                                        .font(.system(size: 40, weight: .semibold))
                                    Text("Night")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("\(selectedLocation.nightTemperature)" + "°")
                                        .font(.system(size: 26, weight: .regular))
                                        .offset(x: 5)
                                }.padding(.trailing)
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                        .padding()
                    }
                    .frame(height: 300)
                    .cornerRadius(50)
                    .padding(.bottom)
                }
                .padding([.leading, .trailing], 20)
                .foregroundColor(.white)
            }
        }
        .onAppear{
            setTimeOfDay()
            selectedLocation = store.locations.first!
        }
    }
    
    
    private func setTimeOfDay() {
        let currentHour = Calendar.current.component(.hour, from: Date())
        if (currentHour >= 6 && currentHour < 16) {
            timeOfDay = .day
        } else if (currentHour >= 16 && currentHour < 20) {
            timeOfDay = .evening
        } else {
            timeOfDay = .night
        }
    }
    
    func getBackgroundImage() -> UIImage {
        var backgroundImage: UIImage
        
        switch timeOfDay {
        case .day:
            backgroundImage = UIImage(named: "morningBackGroundImage")!
        case .evening:
            backgroundImage = UIImage(named: "eveningBackGroundImage")!
        case .night:
            backgroundImage = UIImage(named: "nightBackGroundImage")!
        }
        return backgroundImage
    }
    
    func getWeatherImage() -> String {
        switch timeOfDay {
        case .day:
            return "sun.max.fill"

        case .evening:
            return "cloud.sun.fill"

        case .night:
            return "moon.fill"
        }
    }
    
    func getTodaysDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: Date())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(timeOfDay: .day, show: false)
    }
}

