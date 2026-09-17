import SwiftUI
internal import Combine

class CounterBrain: ObservableObject {
    @Published var count = 0
    func add() {
        count += 1
    }
}
struct ContentView: View {
    @StateObject private var brain = CounterBrain()
    var body: some View{
        NavigationStack {
            VStack(spacing: 30){
                Text("Main counter: \(brain.count)")
                    .font(.title)
                NavigationLink(destination: DetailView(sharedBrain: brain)){
                    Text("Open remote controller")
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
struct DetailView: View {
    @ObservedObject var sharedBrain: CounterBrain
    var body: some View{
        VStack(spacing: 30){
            Text("Guest's screen see: \(sharedBrain.count)")
                .font(.title)
            Button("Add +1"){
                sharedBrain.add()
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Controller")
    }
}
#Preview{
    ContentView()
}
