//
//  HeatwaveMeter.swift
//  RiskQXManager


import SwiftUI

struct HeatwaveMeter: View {
    /*@State */var value: Double
    var image: String
    var text: String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack {
                ZStack {
                    Image("HeatwaveMeter")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 66)
                        .padding()
                    Image("Arrow1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 58)
                        .offset(y: 10)
                        .rotationEffect(.degrees(-87), anchor: .bottom)
                        .rotationEffect(calculateArrowAngle(value: value), anchor: .bottom)
                        .animation(.spring(blendDuration: 1.0))
                }
            }
            .scaleEffect(2)
            .frame(minHeight: 180)
            Rectangle()
                .frame(height: 2)
                .foregroundColor(Color(red: 0.22, green: 0.25, blue: 0.3))
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                Text(text)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer()
                Text("\(String(format: "%.2f", value))")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .padding(8)
        }
        .padding(0)
        .background(Color(red: 0.21, green: 0.23, blue: 0.3))
        .cornerRadius(8)
        
    }
    
    func calculateArrowAngle(value: Double) -> Angle {
            let maxSpeed: Double = 9.9
            let angleRange: Double = 170.0 // Диапазон углов поворота стрелки
            let anglePerUnit = angleRange / maxSpeed
            
            let angle = min(angleRange, max(0, value * anglePerUnit))
            return Angle(degrees: angle)
        }
}

#Preview {
    HeatwaveMeter(value: 4.3, image: "EURUSD", text: "EUR/USD")
}

