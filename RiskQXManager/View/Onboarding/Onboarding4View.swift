//
//  Onboarding4View.swift
//  RiskQXManager
//


import SwiftUI

struct Onboarding4View: View {
    @State private var goToOnboarding5 = false
    var body: some View {
        ZStack {
            OnboardingTemplate()
            VStack {
                // Header/H1
                Text("Question 1/3")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom, 0.4)
                HStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, minHeight: 6, maxHeight: 6)
                        .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                        .cornerRadius(100)
                    Rectangle()
                        .frame(maxWidth: .infinity, minHeight: 6, maxHeight: 6)
                        .foregroundColor(Color(red: 0.29, green: 0.33, blue: 0.43))
                        .cornerRadius(100)
                    Rectangle()
                        .frame(maxWidth: .infinity, minHeight: 6, maxHeight: 6)
                        .foregroundColor(Color(red: 0.29, green: 0.33, blue: 0.43))
                        .cornerRadius(100)
                }
                .padding(.horizontal, 15)
                Spacer()
                Text("How much time are you willing to devote to learning how to trade?")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                Button {
                    goToOnboarding5.toggle()
                } label: {
                    Text("Several times a day")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                Button {
                    goToOnboarding5.toggle()
                } label: {
                    Text("Several days a week")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $goToOnboarding5) {
            Onboarding5View()
        }
//            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

#Preview {
    Onboarding4View()
}
