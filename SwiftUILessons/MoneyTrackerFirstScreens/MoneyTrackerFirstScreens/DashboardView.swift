import SwiftUI

struct DashboardView: View {
    @State private var isUserOnline = true
    var totalBalance: Double{
        var balance = 0.0
        for item in myTransactions{
            if item.isIncome {
                balance += item.amount
            }else{
                balance -= item.amount
            }
        }
        return balance
    }
    let myTransactions = [
        Transaction(category: "Salary", note: "September", amount: 2500.0, imageName: "dollarsign.circle.fill", color: .green, isIncome: true),
        Transaction(category: "Transport", note: "Ford truck fuel", amount: 120.0, imageName: "fuelpump.fill", color: .yellow, isIncome: false),
        Transaction(category: "Tips", note: "waitering shift", amount: 85.0, imageName: "banknote.fill", color: .green, isIncome: true),
        Transaction(category: "Sports", note: "padel court rental", amount: 40.0, imageName: "figure.tennis", color: .orange, isIncome: false),
        Transaction(category: "Groceries", note: "butter and rosemary", amount: 28.50, imageName: "cart.fill", color: .blue, isIncome: false),
        Transaction(category: "Travel", note: "Rome weekend", amount: 350.0, imageName: "airplane", color: .mint, isIncome: false),
        Transaction(category: "Coffee", note: nil, amount: 4.50, imageName: "cup.and.saucer.fill", color: .brown, isIncome: false),
        Transaction(category: "Subscription", note: "Apple Developer", amount: 99.0, imageName: "apple.logo", color: .gray, isIncome: false),
        Transaction(category: "Freelance", note: "iOS app design", amount: 450.0, imageName: "desktopcomputer", color: .green, isIncome: true)
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
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
                        Text("Balance: $\(totalBalance.formatted())")
                            .font(.title2)
                    }
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                .background(Color(.systemGray6))
                ScrollView{
                    VStack{
                         
                        
                        ForEach(myTransactions.indices, id: \.self){ index in
                            let item = myTransactions[index]
    
                            HStack{
                                ZStack{
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundStyle(item.color)
                                    Image(systemName: item.imageName)
                                        .font(.title)
                                }
                                VStack(alignment: .leading){
                                    Text(item.category)
                                        .font(.title)
                                    if let currentNote = item.note{ Text(currentNote)
                                            .font(.title2)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                .padding(.horizontal, 15)
                                Spacer()
                                item.isIncome ? Text("$\((item.amount).formatted())")
                                    .font(.title)
                                    .foregroundStyle(.green) :
                                Text("-$\((item.amount).formatted())")
                                    .font(.title)
                                    .foregroundStyle(.red)
                            }
                            .padding(15)
                            .background(index % 2 == 0 ? Color(Color(.systemGray6)) : Color(.systemBackground))
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                    }
                }
            }
        }
    }
}

struct Transaction: Identifiable{
    let id = UUID()
    let category: String
    let note: String?
    let amount: Double
    let imageName: String
    let color: Color
    let isIncome: Bool
}

#Preview {
    DashboardView()
}
