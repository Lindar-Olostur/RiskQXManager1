//////
//////  
////  PushSubEventView.swift
////  RiskQXManager
////
//
//
//
//import SwiftUI
////import OneSignal
////import AppsFlyerLib
////import Firebase
////import FirebaseAnalytics
////import ScreenshotPreventingSwiftUI
//
//struct PushSubEventView: View {
//    @Environment(\.presentationMode) var presentationMode
////    @EnvironmentObject var webManager: WebViewModel
//    var body: some View {
//        Color("bg")
//            .ignoresSafeArea()
//            .overlay(
//                VStack {
//                    // Header/H1
//                    Text("Don't miss your chance to make money!")
//                        .font(.system(size: 24))
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity, alignment: .top)
//                        .padding(.bottom, 0.4)
//                        .padding(.top)
//                    // Text/Body 1
//                    Text("Turn on push notifications for more efficient use of push notifications")
//                        .font(.system(size: 16))
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
//                        .frame(width: 343, alignment: .top)
//                    Spacer()
//                    HStack(spacing: 14) {
//                        VStack(alignment: .center, spacing: 0) {
//                            HStack {
//                                Image("EURUSD")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 32, height: 32)
//                                Text("EUR/USD")
//                                    .font(.system(size: 14))
//                                    .fontWeight(.medium)
//                                    .foregroundColor(.white)
//                            }
//                            Image("greenArrows")
//                                .resizable()
//                                .frame(width: 41, height: 41)
//                                .padding(.bottom, 8)
//                            Text("12:30")
//                                .font(.system(size: 14))
//                                .fontWeight(.medium)
//                                .foregroundColor(.white)
//                        }
//                        .padding(.horizontal, 16)
//                        .padding(.vertical, 12)
//                        .frame(maxWidth: .infinity)
//                        .background(Color(red: 0.21, green: 0.22, blue: 0.28))
//                        .cornerRadius(8)
//                        .overlay(
//                          RoundedRectangle(cornerRadius: 8)
//                            .inset(by: 0.5)
//                            .stroke(Color(red: 0.22, green: 0.25, blue: 0.31), lineWidth: 1)
//                        )
//                        VStack(alignment: .center, spacing: 0) {
//                            HStack {
//                                Image("AUDUSD")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 32, height: 32)
//                                Text("AUD/USD")
//                                    .font(.system(size: 14))
//                                    .fontWeight(.medium)
//                                    .foregroundColor(.white)
//                            }
//                            Image("redArrows")
//                                .resizable()
//                                .frame(width: 41, height: 41)
//                                .padding(.bottom, 8)
//                            Text("12:30")
//                                .font(.system(size: 14))
//                                .fontWeight(.medium)
//                                .foregroundColor(.white)
//                        }
//                        .padding(.horizontal, 16)
//                        .padding(.vertical, 12)
//                        .frame(maxWidth: .infinity)
//                        .background(Color(red: 0.21, green: 0.22, blue: 0.28))
//                        .cornerRadius(8)
//                        .overlay(
//                          RoundedRectangle(cornerRadius: 8)
//                            .inset(by: 0.5)
//                            .stroke(Color(red: 0.22, green: 0.25, blue: 0.31), lineWidth: 1)
//                        )
//                    }
//                    .padding()
//                    Spacer()
//                    Button {
//                        if let appSettingsURL = URL(string: UIApplication.openSettingsURLString) {
//                            UIApplication.shared.open(appSettingsURL, options: [:], completionHandler: nil)
//                        }
//                        self.presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Continue")
//                            .font(.system(size: 16))
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                        
//                    }
//                    .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
//                }
//                    .onAppear {
////                        AppsFlyerLib.shared().logEvent("push_sub_opened", withValues: nil)
////                        Analytics.logEvent("push_sub_opened", parameters: nil)
//                    }
//                )
////            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//}
//
//struct PushSubEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        PushSubEventView()
////            .environmentObject(WebViewModel())
//            .environment(\.locale, .init(identifier: "ar"))
//    }
//}
