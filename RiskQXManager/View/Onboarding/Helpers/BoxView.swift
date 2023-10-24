//
//  BoxView.swift
//  RiskQXManager
//


import SwiftUI

struct BoxView: View {
    var offset: Int
    var text: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 16.13076) {
            Text(text)
                .font(.system(size: 32))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .padding(38.71383)
        .background(Color(red: 0, green: 0.48, blue: 1))
        .cornerRadius(24.19614)
        .rotationEffect(.degrees(-10))
        Image("boxTail")
            .frame(width: 26.61576, height: 26.61576)
            .scaleEffect(0.6)
            .offset(x:CGFloat(offset), y: -2)
    }
}


#Preview {
    BoxView(offset: -26, text: "Hello!")
}
