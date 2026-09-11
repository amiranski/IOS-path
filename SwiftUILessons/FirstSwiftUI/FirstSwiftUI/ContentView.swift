import SwiftUI
struct ContentView: View {
    let cities = ["Astana", "Almaty", "London", "New York"]
    var body: some View {
        NavigationStack {
            List(cities, id: \.self) { city in
                NavigationLink(value: city){
                    Text(city)
                        .font(.title2)
                }
            }
            .navigationTitle("Cities")
            .navigationDestination(for: String.self) { selectedCity in
                CityDetailView(cityName: selectedCity)
            }
        }
    }
}
struct CityDetailView: View {
    let cityName: String
    var body: some View {
        VStack {
            Text("Weather in city:")
                .font(.title2)
            Text(cityName)
                .font(.system(size: 50, weight: .bold))
                .foregroundStyle(.blue)
            HStack {
                Image(systemName: "sun.max.fill")
                    .foregroundStyle(.yellow)
                Text("25°C")
            }
            .font(.largeTitle)
        }
        .navigationTitle(cityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ContentView()
}
