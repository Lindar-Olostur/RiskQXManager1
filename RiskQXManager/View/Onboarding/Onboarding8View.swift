//
//  Onboarding8View.swift
//  RiskQXManager
//


import SwiftUI
//import ScreenshotPreventingSwiftUI

struct Onboarding8View: View {
    @State private var goToOnboarding9 = false
    var body: some View {
        ZStack {
            OnboardingTemplate()
            VStack {
                // Header/H1
                Text("Question 3/3")
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
                        .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                        .cornerRadius(100)
                }
                .padding(.horizontal, 15)
                Spacer()
                Text("What is your trading experience?")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Button {
                    goToOnboarding9.toggle()
                } label: {
                    Text("Never traded before")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                Button {
                    goToOnboarding9.toggle()
                } label: {
                    Text("Already traded")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $goToOnboarding9) {
            Onboarding9View()
        }
//            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

#Preview {
    Onboarding8View()
}
