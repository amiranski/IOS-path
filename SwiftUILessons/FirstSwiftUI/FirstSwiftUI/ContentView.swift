import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
                    
                    NavigationLink(destination: Text("Settings screen")){
                        Text("Settings")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                            NavigationLink(destination: Text("My profile")) {
                                VStack{
                                    Image(systemName: "person.crop.circle")
                                    Text("My profile")
                                }
                                .padding()
                                .background(Color.blue)
                                .foregroundStyle(Color.white)
                                .cornerRadius(15)
                            }
                            .navigationTitle("Main menu")
                        }
        }
}

#Preview{
    ContentView()
}
