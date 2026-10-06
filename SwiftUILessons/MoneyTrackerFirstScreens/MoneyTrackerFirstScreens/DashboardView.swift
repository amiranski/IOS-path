import SwiftUI

struct DashboardView: View {
    @State private var isUserOnline = false
    var body: some View {
        NavigationStack{
            VStack(spacing: 30){
                HStack(spacing: 30){
                    ZStack{
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 80))
                            .foregroundStyle(Color(.blue))
                        Circle()
                            .fill(isUserOnline ? .green : .gray)
                            .frame(width: 23, height: 23)
                            .offset(x: 20, y: 20)
                    }
                    VStack (spacing: 15){
                        Text("Amiran")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Balance: ")
                            .font(.title2)
                    }
                    Spacer()
                }
                .padding(30)
                .background(Color(.systemGray6))
                ScrollView{
                    VStack{
                        
                    }
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}
#Preview {
    DashboardView()
}
