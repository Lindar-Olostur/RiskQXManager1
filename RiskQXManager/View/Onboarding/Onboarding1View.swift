//
//  
//  Onboarding1View.swift
//  RiskQXManager
//


import SwiftUI
//import AppTrackingTransparency
//import ScreenshotPreventingSwiftUI

struct Onboarding1View: View {
//    @EnvironmentObject var webManager: WebViewModel
    
    @State private var goToOnboarding2 = false
    @State private var showAlert = false
    @State private var progIsHidden = true
    var body: some View {
        ZStack {
            OnboardingTemplate()
                    VStack(alignment: .center) {
                        CustomProgressBar()
                            .opacity(progIsHidden ? 0.0 : 1.0)
                    }
                    .onAppear {
                        showAlert.toggle()
                    }
                }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Allow “RiskQXmanager” to track your activity across other companies’ apps and websites?"),
                            message: Text("You data will be used to deliver personalise ads to you"),
                            primaryButton: .default(Text("Ask App Not to Track"), action: {
                                progIsHidden.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    goToOnboarding2 = true
                                }
                            }),
                            secondaryButton: .default(Text("Allow tracking"), action: {
                                progIsHidden.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    goToOnboarding2 = true
                                }
                            })
                        )
                    }
                    .fullScreenCover(isPresented: $goToOnboarding2) {
                        Onboarding2View()
                    }
//            .screenshotProtected(isProtected: webManager.screenBlock)
    }
//    private func requestTrackingAuthorization() {
//        if #available(iOS 14, *) {
//            ATTrackingManager.requestTrackingAuthorization { (status) in
//                switch status {
//                case .denied:
//                    print("AuthorizationStatus is denied")
//                    goToOnboarding2 = true
//                case .notDetermined:
//                    print("AuthorizationStatus is notDetermined")
//                    goToOnboarding2 = true
//                case .restricted:
//                    print("AuthorizationStatus is restricted")
//                    goToOnboarding2 = true
//                case .authorized:
//                    print("AuthorizationStatus is authorized")
//                    goToOnboarding2 = true
//                @unknown default:
//                    fatalError("Invalid authorization status")
//                }
//            }
//        }
//    }
}

struct Onboarding1View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1View()
//            .environmentObject(WebViewModel())
//            .environment(\.locale, .init(identifier: "ar"))
    }
}
