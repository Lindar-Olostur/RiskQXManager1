////
////  
////  PushEvent2View..swift
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
//struct PushEvent2View_: View {
////    @EnvironmentObject var webManager: WebViewModel
//    @EnvironmentObject var userSettings: UserSettings
//    @State private var shoeTabFromPush = false
//    var body: some View {
//        Color("bg")
//            .ignoresSafeArea()
//            .overlay(
//                VStack(alignment: .center) {
//                    Text("Congratulations! Your demo account is growing. Start earning from your first deposit now")
//                        .font(.system(size: 24))
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity, alignment: .top)
//                        .padding(.bottom, 0.4)
//                        .padding(.top)
//                    
//                    Spacer()
//                    Image("dep")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 275)
//                    Spacer()
//                    Spacer()
//                    Button {
////                        webManager.view = MyWebView(urlString: "https://qxbroker.com/\(getSystemLanguage())/deposit")
//                        shoeTabFromPush.toggle()
//                    } label: {
//                        Text("Continue")
//                            .font(.system(size: 16))
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
//                }
//                    .onAppear {
////                        AppsFlyerLib.shared().logEvent("push_event2_opened", withValues: nil)
////                        Analytics.logEvent("push_event2_opened", parameters: nil)
//                    }
//                    .fullScreenCover(isPresented: $shoeTabFromPush) {
//                        NewTabView()
//                    }
//                )
////            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//    func getSystemLanguage() -> String {
//            let locale = Locale.current
//            let languageCode = locale.languageCode ?? ""
//            return languageCode
//        }
//}
//
//struct PushEvent2View__Previews: PreviewProvider {
//    static var previews: some View {
//        PushEvent2View_()
//            .environmentObject(UserSettings())
////            .environmentObject(WebViewModel())
//            .environment(\.locale, .init(identifier: "ru"))
//    }
//}
