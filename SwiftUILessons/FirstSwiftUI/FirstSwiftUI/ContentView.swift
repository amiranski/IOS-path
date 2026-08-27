import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                Text("\(Date(), format: .dateTime.weekday(.wide)), \(Date(), format: .dateTime.day().month(.wide))")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(.white.opacity(0.8))
                    .padding(.top, 20)
                
                
                Text("Astana")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundStyle(Color(
                        red: 0.039,
                        green: 0.729,
                        blue: 0.709
                    ))
                
                Text("25°C")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundStyle(.white.opacity(0.8))
                
                Text("Partly Cloudy")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundStyle(.linearGradient(colors: [.gray, .white], startPoint: .top, endPoint: .bottom))
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 10)
                    {
                        Image(systemName: "wind")
                            .font(.system(size: 40))
                        
                        Text("4 m/s")
                            .font(.system(size: 34, weight: .medium))
                        Divider()
                            .frame(width: 2, height: 40)
                            .background(Color.white.opacity(0.5))
                        Image(systemName: "humidity")
                            .font(.system(size: 40))
                        
                        Text("5 %")
                            .font(.system(size: 34, weight: .medium))
                    }
                }
                    .foregroundStyle(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )

                .padding(.top, 10)
                Grid(verticalSpacing: 12){
                    GridRow {
                        Text("Mo")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .bold))
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 23°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                        Image(systemName: "moon.fill")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 17°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                    GridRow{
                        Text("Tu")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .bold))
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 25°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                        Image(systemName: "moon.fill")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 19°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                    GridRow{
                        Text("We")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .bold))
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 27°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                        Image(systemName: "moon.fill")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 20°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                    GridRow{
                        Text("Th")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .bold))
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 29°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                        Image(systemName: "moon.fill")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 19°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                    GridRow{
                        Text("Fr")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .bold))
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 31°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                        Image(systemName: "moon.fill")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 22°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                    GridRow{
                        Text("Sa")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .bold))
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 30°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                        Image(systemName: "moon.fill")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 25°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                    GridRow{
                        Text("Su")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .bold))
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 27°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                        Image(systemName: "moon.fill")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(.yellow)
                        Text(" 19°C")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                        Spacer()
                    }
                .padding(.top, 20)
                }
            }
        }
    }

#Preview {
    ContentView()
}
