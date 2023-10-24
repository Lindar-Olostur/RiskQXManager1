//
//  Onboarding10View.swift
//  RiskQXManager
//


import SwiftUI
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import ScreenshotPreventingSwiftUI

struct Onboarding10View: View {
    @EnvironmentObject var userSettings: UserSettings
    //    @EnvironmentObject var webManager: WebViewModel
    @State private var finishOnboarding = false
    var body: some View {
        ZStack {
            OnboardingTemplate()
            VStack {
                // Header/H1
                Text("Done!")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom, 0.4)
                // Text/Body 1
                Text("The application is adjusted for you")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
                    .frame(width: 343, alignment: .top)
                
                Spacer()
                BoxView(offset: -56, text: "Let's start")
                Spacer()
                Button {
                    UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
                    finishOnboarding = true
                    userSettings.isOnboardingCompleted = true
                    //                        AppsFlyerLib.shared().logEvent("onboarding_finish", withValues: nil)
                    //                        Analytics.logEvent("onboarding_finish", parameters: nil)
                } label: {
                    Text("Get started")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                .padding(.bottom)
            }
        }
        .fullScreenCover(isPresented: $finishOnboarding) {
            NewTabView()
                .environmentObject(userSettings)
            //                            .environmentObject(webManager)
        }
        //        .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

#Preview {
    Onboarding10View()
        .environmentObject(UserSettings())
    //        .environmentObject(WebViewModel())
}
