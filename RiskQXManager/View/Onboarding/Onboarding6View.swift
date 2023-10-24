//
//  Onboarding6View.swift
//  RiskQXManager
//


import SwiftUI
//import ScreenshotPreventingSwiftUI

struct Onboarding6View: View {
    @State private var goToOnboarding7 = false
    var body: some View {
        ZStack {
            OnboardingTemplate()
            VStack {
                // Header/H1
                Text("Question 2/3")
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
                        .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                        .cornerRadius(100)
                    Rectangle()
                        .frame(maxWidth: .infinity, minHeight: 6, maxHeight: 6)
                        .foregroundColor(Color(red: 0.29, green: 0.33, blue: 0.43))
                        .cornerRadius(100)
                }
                .padding(.horizontal, 15)
                Spacer()
                Text("What income per week do you want to come to?")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Button {
                    goToOnboarding7.toggle()
                } label: {
                    Text("< 1000")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                Button {
                    goToOnboarding7.toggle()
                } label: {
                    Text("> 1000")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $goToOnboarding7) {
            Onboarding7View()
        }
//            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

#Preview {
    Onboarding6View()
}
