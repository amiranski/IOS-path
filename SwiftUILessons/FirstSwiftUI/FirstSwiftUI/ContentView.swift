import SwiftUI
import UIKit

struct ContentView: View {
    @State private var isRefreshing = false
    @State private var isSecondRefreshing = false
    @State private var myText = ""
    var body: some View {
        VStack(spacing: 30){
            Spinner(isSpinning: isRefreshing)
            Spinner(isSpinning: isSecondRefreshing)
            Button(action: {
                isRefreshing.toggle()
            }){
                Text(isRefreshing ? "Stop loading" : "Start loading")
                    .padding()
                    .background(isRefreshing ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                isSecondRefreshing.toggle()
            }){
                Text(isSecondRefreshing ? "Stop loading" : "Start loading")
                    .padding()
                    .background(isSecondRefreshing ? Color.orange : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            CustomTextField(text: $myText){
                Text("You entered: \(myText)")
            }
        }
        }
    }

struct CustomTextField{
    @Binding var text: String
    
    class Coordinator: NSObject, UITextFieldDelegate{
        var parent: CustomTextField
        init(_ parent: CustomTextField){
            self.parent = parent
        }
        func textFieldDidChangeSelection(_ textField: UITextField){
            parent.text = textField.text ?? ""
        }
    }
    
    makeCoordinator(){
        return Coordinator(self)
    }
    
    makeUIView(context: Context) -> UITextField{
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        
        textField.delegate = context.coordinator
        return textField
    }
    
    updateUIView(_ uiView: UITextField, context: Context){
        if uiView.text != text {
            uiView.text = text
        }
    }
}

struct Spinner: UIViewRepresentable{
    var isSpinning: Bool
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        return indicator
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context){
        if isSpinning == true{
            uiView.startAnimating()
        }else{
            uiView.stopAnimating()
        }
    }
}
#Preview{
   ContentView()
}
