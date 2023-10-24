//
//  Onboarding2View.swift
//  RiskQXManager
//


import SwiftUI
//import ScreenshotPreventingSwiftUI

struct Onboarding2View: View {
    @State private var goToOnboarding3 = false
    var body: some View {
        ZStack {
            OnboardingTemplate()
            VStack {
                // Header/H1
                Text("Welcome!")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom, 0.4)
                // Text/Body 1
                Text("We suggest you answer 3 simple questions before using the app")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
                    .frame(width: 343, alignment: .top)
                
                Spacer()
                BoxView(offset: -26, text: "Hello!")
                Spacer()
                Button {
                    goToOnboarding3.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                .padding(.bottom)
            }
        }
        .fullScreenCover(isPresented: $goToOnboarding3) {
            Onboarding3View()
        }
//        .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

#Preview {
    Onboarding2View()
}
