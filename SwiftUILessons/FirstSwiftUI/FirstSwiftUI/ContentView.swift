import SwiftUI

struct ContentView: View {
    @State private var isVisible = false
    var body: some View {
        VStack(spacing: 30){
            Button(isVisible ? "Hide" : "Show"){
                withAnimation(.easeInOut(duration: 0.8)){
                    isVisible.toggle()
                }
            }
            .font(.title)
            if isVisible{
                Text("SwiftUI Transitions")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.blue.cornerRadius(15))
                    .foregroundStyle(.white)
                    .transition(
                        .asymmetric(
                            insertion: .opacity,
                            removal: .move(edge: .bottom)
                        )
                    )
            }
            Spacer()
        }
        .padding()
    }
}


#Preview{
   ContentView()
}
