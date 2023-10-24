//
//  Onboarding3View.swift
//  RiskQXManager
//


import SwiftUI
//import OneSignal
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import ScreenshotPreventingSwiftUI

struct Onboarding3View: View {
    //    @EnvironmentObject var webManager: WebViewModel
    @State private var goToOnboarding4 = false
    @State private var showAlert = false
    var body: some View {
        ZStack {
            OnboardingTemplate()
            ZStack {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Image("screenBack")
                        .frame(maxWidth: .infinity)
                    Image("screen3")
                        .frame(maxWidth: .infinity)
                } else {
                    Image("screenBack")
                        .resizable()
//                        .frame(maxWidth: .infinity)
                    Image("screen3")
                        .resizable()
//                        .frame(maxWidth: .infinity)
                    
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
                Text("Use the currensy volume")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom, 0.4)
                // Text/Body 1
                Text("Currency charts will help you adjust your strategy")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
                    .frame(width: 343, alignment: .top)
                Spacer()
                Button {
                    goToOnboarding4.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                .padding(.bottom)
//                Button {
//                    //                        OneSignal.promptForPushNotifications(userResponse: { accepted in
//                    //                            print("User accepted notification: \(accepted)")
//                    //                            goToOnboarding4 = true
//                    //                        })
//                    showAlert = true
//                } label: {
//                    Text("Continue")
//                        .font(.system(size: 16))
//                        .fontWeight(.semibold)
//                }
//                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
//                .padding(.bottom)
            }
        }
        .fullScreenCover(isPresented: $goToOnboarding4) {
            Onboarding4View()
        }
//        .alert(isPresented: $showAlert) {
//            Alert(
//                title: Text("'Qx quiz' would like to Send You Notifications"),
//                message: Text("Notifications may include alerts, sounds and icon badges. These can be configured in Settings."),
//                primaryButton: .default(Text("Don’t Allow"), action: {
//                    goToOnboarding4 = true
//                }),
//                secondaryButton: .default(Text("Allow"), action: {
//                    goToOnboarding4 = true
//                })
//            )
//        }
        //            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

#Preview {
    Onboarding3View()
    //            .environmentObject(WebViewModel())
}
