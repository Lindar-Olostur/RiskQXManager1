////
////  
////  SuccessRegistrationView.swift
////  RiskQXManager
////
//
//
//import SwiftUI
////import AppsFlyerLib
////import Firebase
////import FirebaseAnalytics
////import OneSignal
////import ScreenshotPreventingSwiftUI
//
//struct SuccessRegistrationView: View {
//    @Environment(\.presentationMode) var presentationMode
////    @EnvironmentObject var webManager: WebViewModel
//    @EnvironmentObject var userSettings: UserSettings
//    var body: some View {
//        ZStack {
//            OnboardingTemplate()
//            VStack(alignment: .center) {
//                Spacer()
//                VStack {
//                    VStack(alignment: .center) {
//                        Image("regPic")
//                            .resizable()
//                            .frame(width: 60, height: 60)
//                            .padding(8)
//                        Text("Registration completed.")
//                            .font(.system(size: 18))
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                        Text("Great job!")
//                            .font(.system(size: 18))
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                    }
//                    .padding(.vertical, 40)
//                    .frame(maxWidth: .infinity, alignment: .center)
//                    .background(Color(red: 0.13, green: 0.14, blue: 0.18))
//                    .cornerRadius(8)
//                    .padding(.horizontal, 16)
//                }
//                .frame(maxWidth: .infinity)
//                .cornerRadius(15)
//                .padding(.vertical)
//                Spacer()
//                Button {
//                    userSettings.event0 = true
//                    userSettings.saveUserToUserDefaults()
//                    //                        OneSignal.sendTags(["reg": "true"])
//                    self.presentationMode.wrappedValue.dismiss()
//                } label: {
//                    Text("Next")
//                        .font(.system(size: 16))
//                        .fontWeight(.semibold)
//                        .foregroundColor(.white)
//                }
//                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
//            }
//            .onAppear {
//                //                        AppsFlyerLib.shared().logEvent("event0_success", withValues: nil)
//                //                        Analytics.logEvent("event0_success", parameters: nil)
//            }
//        }
////            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//}
//
//struct SuccessRegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessRegistrationView()
////            .environmentObject(WebViewModel())
//            .environmentObject(UserSettings())
////            .environment(\.locale, .init(identifier: "ru"))
//    }
//}
