////
//////  
////  SuccessDView.swift
////  RiskQXManager
////
//
//import SwiftUI
////import AppsFlyerLib
////import Firebase
////import FirebaseAnalytics
////import OneSignal
////import ScreenshotPreventingSwiftUI
//
//struct SuccessDView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var userSettings: UserSettings
////    @EnvironmentObject var webManager: WebViewModel
//    var body: some View {
//        ZStack {
//            OnboardingTemplate()
//                VStack(alignment: .center) {
//                    Spacer()
//                    VStack {
//                        VStack(alignment: .center) {
//                            Image("depPic")
//                                .resizable()
//                                .frame(width: 60, height: 60)
//                                .padding(8)
//                            Text("Your first deposit was successful.")
//                                .font(.system(size: 18))
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                            Text("Congrats!")
//                                .font(.system(size: 18))
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                        }
//                        .padding(.vertical, 40)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        .background(Color(red: 0.13, green: 0.14, blue: 0.18))
//                        .cornerRadius(8)
//                        .padding(.horizontal, 16)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .cornerRadius(15)
//                    .padding(.vertical)
//                    Spacer()
//                    Button {
//                        userSettings.event1 = true
//                        userSettings.saveUserToUserDefaults()
////                        OneSignal.sendTags(["dep": "true"])
//                        self.presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Next")
//                            .font(.system(size: 16))
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
//                }
//                    .onAppear {
////                        AppsFlyerLib.shared().logEvent("event1_success", withValues: nil)
////                        Analytics.logEvent("event1_success", parameters: nil)
//                    }
//                }
////            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//}
//
//struct SuccessDView_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessDView()
////            .environmentObject(WebViewModel())
//            .environmentObject(UserSettings())
//            .environment(\.locale, .init(identifier: "ru"))
//    }
//}
