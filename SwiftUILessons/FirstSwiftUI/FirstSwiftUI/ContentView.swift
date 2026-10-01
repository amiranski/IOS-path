import SwiftUI

struct ContentView: View {
    @State private var isRefreshing = false
    var body: some View {
        Spinner()
    }
}

struct Spinner: UIViewRepresentable{
    func makeUIView()  {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    func updateUIView(){
        
    }
}
#Preview{
   ContentView()
}
