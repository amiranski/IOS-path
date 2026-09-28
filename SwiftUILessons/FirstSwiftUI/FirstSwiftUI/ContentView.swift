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
        @State private var isAddingSkill = false
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
                                if showBanner{
                                    BannerView(isVisible: $showBanner)
                                        .transition(.scale)
                                }
                                ForEach(adam.skills, id: \.self){ skill in
                                    Text(skill)
                                        .skillCardStyle()
                                    
                                }
                            }
                        }
                    }
                }
                .toolbar{
                    Button {
                isAddingSkill = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $isAddingSkill){
                    AddSkillSheet(profile: adam)
                    }
        }
    }
}

struct BannerView: View {
    @Binding var isVisible: Bool
    var body: some View {
        HStack{
            Text("Hi, I'm learning Swift UI!")
            Button("Close"){
                withAnimation{
                    isVisible = false
                }
            }
        }
    }
}

struct AddSkillSheet: View {
    var profile: ProfileData
    @State private var newSkillText = ""
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            TextField("Add skill", text: $newSkillText)
            Button("Save"){
                if newSkillText.isEmpty{
                    showAlert = true
                } else {
                    profile.skills.append(newSkillText)
                    dismiss()
                }
            }
        }
        .alert("Error", isPresented: $showAlert){
            Button("OK", role: .cancel){}
        } message: {
            Text("Pole can't be empty")
        }
    }
}
struct SkillCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
extension View {
    func skillCardStyle() -> some View {
        self.modifier(SkillCardStyle())
    }
}
#Preview{
   ContentView()
}
