import SwiftUI

    @Observable
    class ProfileData {
        var name = "Adam"
        var city = "Prague"
        var isLookingForJob = true
        var skills = ["C#", "Swift UI basics", "Hockey"]
    }
    struct ContentView: View {
        @State private var adam = ProfileData()
        @Environment(\.colorScheme) var colorScheme
        @State private var showBanner = true 
        var body: some View {
            NavigationStack {
                GeometryReader{ geo in
                    VStack(spacing: 0){
                        ZStack{
                            HStack{
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                VStack(alignment: .leading){
                                   Text(adam.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Text(adam.city)
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                                VStack{
                                    Toggle("Is looking for job", isOn: $adam.isLookingForJob)
                    .labelsHidden()
                                    Text("Is looking for job")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                            }
                            .padding()
                        }
                        .background(colorScheme == .dark ? Color.black : Color.white)
                        .frame(height: geo.size.height * 0.25)
                        Divider()
                        ScrollView{
                            VStack(spacing: 15){
                                ForEach(adam.skills, id: \.self){ skill in
                                    Text(skill)
                                        .font(.title2)
                                    
                                }
                            }
                        }
                    }
                }
        }
    }
}

struct BannerView{
    var body: some View {
        @Environment(\.dismiss) var dismiss
        HStack{
            Text("Hi, I'm learning Swift UI!")
            Button("Close"){
                dismiss()
            }
        }
    }
}
#Preview{
   ContentView()
}
