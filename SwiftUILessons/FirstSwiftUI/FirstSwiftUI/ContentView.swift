import SwiftUI
import Observation

@Observable
class WeatherManager{
    var currentTemp = 20
    var cityName = "Astana"
    var isDownloaded = false
}

@State private var weather = WeatherManager()

struct WeatherDetailView: View {
    let weather: WeatherManager
    var body: some View {
        Text("Temperature: \(weather.currentTemp)")
    }
}

struct EditWeatherView: View{
    @Bindable var weather: WeatherManager
    var body: some View{
        TextField("City", text: $weather.cityName)
    }
}
