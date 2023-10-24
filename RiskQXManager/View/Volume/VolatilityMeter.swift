//
//  VolatilityMeter.swift
//  RiskQXManager
//


import SwiftUI

struct VolatilityMeter: View {
    @EnvironmentObject var userSettings: UserSettings
    @State var persent: Double
    @State var pair: String
    @State var flags: String
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .foregroundColor(Color(red: 0.9, green: 0.34, blue: 0.23))
                    
                    Rectangle()
                        .frame(width: min(CGFloat(self.persent) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(red: 0.35, green: 0.78, blue: 0.31))
                        .animation(.linear) // не работает
                }
                .cornerRadius(5.0)
            }
            HStack {
                Spacer()
                HStack {
                    Text("\(String(format: "%.f", persent*100))%")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.35, green: 0.78, blue: 0.31))
                    Image("greenArrows")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .offset(x: -8)
                }
                Spacer()
                Image(flags)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                Text(pair)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer()
                HStack {
                    Text("\(String(format: "%.f", 100-persent*100))%")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.9, green: 0.34, blue: 0.23))
                        .offset(x: 8)
                    Image("redArrows")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                Spacer()
            }
//            Button("NEW") {
//                persent = Double.random(in: 0.1...0.9)
//            }
        }
        .onAppear {
            Task {
                await updatePersentsAsync()
            }
        }
        .onDisappear {
            userSettings.saveUserToUserDefaults()
        }
    }
    func updatePersentsAsync() async {
        while true {
            await Task.sleep(5 * 1_000_000_000) // Пауза в 5 секунд
            let isPlus = Bool.random()
            let value = Double.random(in: 0.00...0.1)
            if isPlus {
                persent += value
                if persent > 0.99 {
                    persent = 0.99
                }
            } else {
                persent -= value
                if persent < 0.00 {
                    persent = 0.01
                }
            }
        }
    }
}

#Preview {
    VolatilityMeter(persent: 0.8, pair: "GBP/USD", flags: "GBPUSD")
}
