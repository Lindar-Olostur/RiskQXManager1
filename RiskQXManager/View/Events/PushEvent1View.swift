////
////  
////  PushEvent1View.swift
////  RiskQXManager
//
//
////
//
//import SwiftUI
////import AppsFlyerLib
////import Firebase
////import FirebaseAnalytics
////import ScreenshotPreventingSwiftUI
//
//struct PushEvent1View: View {
//    @EnvironmentObject var userSettings: UserSettings
////    @EnvironmentObject var webManager: WebViewModel
//    @Environment(\.presentationMode) var presentationMode
//    var body: some View {
//        Color("bg")
//            .ignoresSafeArea()
//            .overlay(
//                VStack(alignment: .center) {
//                    VStack {
//                        Text("Already ")
//                            .font(.system(size: 24))
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                        +
//                            Text("343 568")
//                            .font(.system(size: 24))
//                            .fontWeight(.bold)
//                            .foregroundColor(Color("AccentPrimary"))
//                        +
//                        Text(" users have registered and are earning right now")
//                            .font(.system(size: 24))
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                    }
//                    .multilineTextAlignment(.center)
//                    .padding(.top)
//                    Spacer()
//                    VStack {
//                        VStack(alignment: .center, spacing: 0) {
//                            VStack {
//                                HStack {
//                                    Image("alexTrader")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 50, height: 50)
//                                    VStack(alignment: .leading) {
//                                        Text("Alex")
//                                            .font(.system(size: 18))
//                                            .fontWeight(.semibold)
//                                            .foregroundColor(.white)
//                                        Text("Trader")
//                                            .font(.system(size: 16))
//                                            .multilineTextAlignment(.center)
//                                            .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
//                                    }
//                                    Spacer()
//                                }
//                                VStack(alignment: .center, spacing: 0) {
//                                    Text("Deposit")
//                                        .font(.system(size: 16))
//                                        .foregroundColor(.white)
//                                    Text("250$")
//                                        .font(.system(size: 18))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.white)
//                                }
//                                .padding(.horizontal, 12)
//                                .padding(.vertical, 8)
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .background(Color(red: 0.29, green: 0.33, blue: 0.43))
//                                .cornerRadius(12)
//                                VStack(alignment: .center, spacing: 0) {
//                                    HStack {
//                                        Text("1.")
//                                            .font(.system(size: 16))
//                                            .foregroundColor(.white)
//                                            .fontWeight(.medium)
//                                        Spacer()
//                                        Text("Buy")
//                                            .font(.system(size: 16))
//                                            .foregroundColor(.white)
//                                            .fontWeight(.medium)
//                                        Spacer()
//                                    }
//                                }
//                                .padding(.horizontal, 12)
//                                .padding(.vertical, 8)
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .background(Color(red: 0.35, green: 0.78, blue: 0.31))
//                                .cornerRadius(12)
//                                VStack(alignment: .center, spacing: 0) {
//                                    HStack {
//                                        Text("2.")
//                                            .font(.system(size: 16))
//                                            .foregroundColor(.white)
//                                            .fontWeight(.medium)
//                                        Spacer()
//                                        Text("Sell")
//                                            .font(.system(size: 16))
//                                            .foregroundColor(.white)
//                                            .fontWeight(.medium)
//                                        Spacer()
//                                    }
//                                }
//                                .padding(.horizontal, 12)
//                                .padding(.vertical, 8)
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .background(Color(red: 0.9, green: 0.34, blue: 0.23))
//                                .cornerRadius(12)
//                                VStack(alignment: .center, spacing: 0) {
//                                    HStack {
//                                        Text("3.")
//                                            .font(.system(size: 16))
//                                            .foregroundColor(.white)
//                                            .fontWeight(.medium)
//                                        Spacer()
//                                        Text("Sell")
//                                            .font(.system(size: 16))
//                                            .foregroundColor(.white)
//                                            .fontWeight(.medium)
//                                        Spacer()
//                                    }
//                                }
//                                .padding(.horizontal, 12)
//                                .padding(.vertical, 8)
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .background(Color(red: 0.9, green: 0.34, blue: 0.23))
//                                .cornerRadius(12)
//                                VStack(alignment: .center, spacing: 0) {
//                                    HStack {
//                                        Text("4.")
//                                            .font(.system(size: 16))
//                                            .foregroundColor(.white)
//                                            .fontWeight(.medium)
//                                        Spacer()
//                                        Text("Buy")
//                                            .font(.system(size: 16))
//                                            .foregroundColor(.white)
//                                            .fontWeight(.medium)
//                                        Spacer()
//                                    }
//                                }
//                                .padding(.horizontal, 12)
//                                .padding(.vertical, 8)
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .background(Color(red: 0.35, green: 0.78, blue: 0.31))
//                                .cornerRadius(12)
//                                VStack(alignment: .center, spacing: 0) {
//                                    Text("Profit")
//                                        .font(.system(size: 16))
//                                        .foregroundColor(.white)
//                                    Text("1000$")
//                                        .font(.system(size: 18))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(Color(red: 0.35, green: 0.78, blue: 0.31))
//                                }
//                                .padding(.horizontal, 12)
//                                .padding(.vertical, 8)
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .background(Color(red: 0.29, green: 0.33, blue: 0.43))
//                                .cornerRadius(12)
//                            }
//                            .padding(.vertical, 20)
//                            .padding(.horizontal, 32)
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
//                    .padding(.horizontal, 38)
//                    Spacer()
//                    Button {
//                        userSettings.selectedTab = 0
//                        self.presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Continue")
//                            .font(.system(size: 16))
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
//                }
//                    .onAppear {
////                        AppsFlyerLib.shared().logEvent("push_event1_opened", withValues: nil)
////                        Analytics.logEvent("push_event1_opened", parameters: nil)
//                    }
//                )
////            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//}
//
//struct PushEvent1View_Previews: PreviewProvider {
//    static var previews: some View {
//        PushEvent1View()
////            .environmentObject(WebViewModel())
//            .environmentObject(UserSettings())
//            .environment(\.locale, .init(identifier: "ru"))
//    }
//}
