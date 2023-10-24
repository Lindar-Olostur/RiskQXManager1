//
//  Onboarding5View.swift
//  RiskQXManager
//


import SwiftUI
//import ScreenshotPreventingSwiftUI

struct Onboarding5View: View {
    @State private var goToOnboarding6 = false
    var body: some View {
        ZStack {
            OnboardingTemplate()
            ZStack {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Image("screenBack")
                        .frame(maxWidth: .infinity)
                    Image("screen5")
                        .frame(maxWidth: .infinity)
                } else {
                    Image("screenBack")
                        .resizable()
                    Image("screen5")
                        .resizable()
                }
            }
            .offset(y: 83)
            .scaleEffect(0.8)
            .overlay(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color.clear, location: 0),
                        .init(color: Color("bg1"), location: 0.8)
                    ]),
                    startPoint: UnitPoint(x: 0.5, y: 0.2),
                    endPoint: .bottom
                )
            )
            VStack {
                // Header/H1
                Text("Use the signals")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom, 0.4)
                // Text/Body 1
                Text("Signals will help you take the first steps in trading")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
                    .frame(width: 343, alignment: .top)
                Spacer()
                Button {
                    goToOnboarding6.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                .padding(.bottom)
            }
        }
        .fullScreenCover(isPresented: $goToOnboarding6) {
            Onboarding6View()
        }
//        .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

#Preview {
    Onboarding5View()
}
