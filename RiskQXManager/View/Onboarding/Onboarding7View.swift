//
//  Onboarding7View.swift
//  RiskQXManager
//

import SwiftUI
//import ScreenshotPreventingSwiftUI

struct Onboarding7View: View {
    //    @EnvironmentObject var webManager: WebViewModel
    @State private var goToOnboarding8 = false
    @State private var showAlert = false
    var body: some View {
        ZStack {
            OnboardingTemplate()
            ZStack {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Image("screenBack")
                        .frame(maxWidth: .infinity)
                    Image("screen7")
                        .frame(maxWidth: .infinity)
                } else {
                    Image("screenBack")
                        .resizable()
                    Image("screen7")
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
            if UIDevice.current.userInterfaceIdiom == .pad {
                Image("over7")
                    .scaleEffect(0.9)
            } else {
                Image("over7")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.95)
            }
            
            VStack {
                // Header/H1
                Text("Stay tuned with our trading ideas and real-time signals")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .top)
                
                Spacer()
                Button {
                    //                        OneSignal.promptForPushNotifications(userResponse: { accepted in
                    //                            print("User accepted notification: \(accepted)")
                    //                            goToOnboarding4 = true
                    //                        })
                    showAlert = true
                } label: {
                    Text("Show")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                .padding(.bottom)
            }
        }
        .fullScreenCover(isPresented: $goToOnboarding8) {
            Onboarding8View()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("“RiskQXmanager” would like to Send You Notifications"),
                message: Text("Notifications may include alerts, sounds and icon badges. These can be configured in Settings."),
                primaryButton: .default(Text("Don’t Allow"), action: {
                    goToOnboarding8 = true
                }),
                secondaryButton: .default(Text("Allow"), action: {
                    goToOnboarding8 = true
                })
            )
        }
        //            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

#Preview {
    Onboarding7View()
}
