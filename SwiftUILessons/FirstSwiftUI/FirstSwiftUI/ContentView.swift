import SwiftUI

struct ContentView: View {
    @State private var currentTemp = 20
    @State private var cityName = "Astana"
    var body: some View {
        VStack(spacing: 30){
            Text("\(currentTemp)°C")
                .font(.system(size: 60, weight: .bold))
            Button(action: {
                currentTemp += 1
            }){
                Text("Make more warm")
                    .padding()
                    .background(Color.orange)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
        }
        VStack(spacing: 30){
            Text("Weather in city: \(cityName)")
                .font(.title)
            TextField("Enter city", text: $cityName)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
