//
//  OnboardingTemplate.swift
//  RiskQXManager
//


import SwiftUI

struct OnboardingTemplate: View {
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    Image("bgVector")
                        .resizable()
                        .scaledToFill()
                }
            )
    }
}

#Preview {
    OnboardingTemplate()
}
