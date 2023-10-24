//
//  StartTabView.swift
//  RiskQXManager
//


import SwiftUI
//import OneSignal
//import AppsFlyerLib
//import Firebase
//import FirebaseDatabase
//import FirebaseAnalytics
import Combine

struct StartTabView: View {
    @EnvironmentObject var userSettings: UserSettings
//    @EnvironmentObject var webManager: WebViewModel
//    var view: MyWebView
    @State private var goToOnboarding1 = false
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Group {
                        VolumeView()
//                        if webManager.isLoading {
//                            LoaderView(tintColor: Color("blueBTN"), scaleSize: 2.0).padding(.bottom,50)
//                        } else {
//                            if webManager.serverResponse == 1 {
//                                view
//                            } else {
//                                VolumeView()
//                            }
//                        }
                    }
                }
                    .onAppear {
                        checkOnboarding()
//                        if webManager.successEnter == false {
//                            webManager.askServer()
//                        }
                    }
                    .onDisappear {
                        userSettings.saveUserToUserDefaults()
                    }
                    .fullScreenCover(isPresented: $goToOnboarding1) {
                        Onboarding1View()
                    }
            )
    }
    func checkOnboarding() {
        if userSettings.isOnboardingCompleted == false {
            goToOnboarding1 = true
//            AppsFlyerLib.shared().logEvent("onboarding_start", withValues: nil)
//            Analytics.logEvent("onboarding_start", parameters: nil)
            userSettings.isOnboardingCompleted = true
        }
    }
}



#Preview {
    StartTabView()//(view: MyWebView(urlString: "https://fdqfm.bemobtrcks.com/go/2ce4cfd7-2657-480a-a173-d206cf2a313e?clickId=1688194164160-4457247&siteId=app.qxquiz.com"))
        .environmentObject(UserSettings())
//            .environmentObject(WebViewModel())
}
