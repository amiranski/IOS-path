import SwiftUI

struct ContentView: View {
    @State private var isLiked = false
    var body: some View {
        Button{
            isLiked.toggle()
        }label:{
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .foregroundStyle(isLiked ? .red : .gray)
                .font(.largeTitle)
        }
        .padding()
        .accessibilityLabel(isLiked ? "Remove like" : "Like")
    }
}

#Preview{
   ContentView()
}
