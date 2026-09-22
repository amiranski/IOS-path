import SwiftUI

struct ContentView: View{
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 40){
            Text("Profile screen")
                .font(.largeTitle)
            Button(action: {
                dismiss()
            }){
                Text("Close this screen")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(15)
                    .padding(.horizontal)
            }
        }
    }
}
#Preview{
   ContentView()
}
