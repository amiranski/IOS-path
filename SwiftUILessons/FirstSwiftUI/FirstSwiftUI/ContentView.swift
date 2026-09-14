import SwiftUI

struct ContentView: View {
   @State private var username = ""
    @State private var isPrivate = false
    @State private var selectedCity = "London"
    @State private var flightDate = Date()
    let cities = ["London", "Moscow", "Miami"]
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Profile")) {
                    TextField("Your name", text: $username)
                    Toggle("Closed profile", isOn: $isPrivate)
                }
                Section(header: Text("Trip")) {
                    Picker("City", selection: $selectedCity){
                        ForEach(cities, id: \.self){ city in
                            Text(city)
                        }
                    }
                    .pickerStyle(.menu)
                    DatePicker("Flight date", selection: $flightDate, displayedComponents: [.date, .hourAndMinute])
                }
            }
            .navigationTitle("Settings")
        }
    }
}
#Preview{
    ContentView()
}
