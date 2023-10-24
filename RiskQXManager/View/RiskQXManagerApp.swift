//
//  RiskQXManagerApp.swift
//  RiskQXManager
//

import SwiftUI
import ScreenshotPreventingSwiftUI

@main
struct RiskQXManagerApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate //подключение делегата к приложению
//    @StateObject private var appDelegateObserver = AppDelegateObserver()
    @StateObject private var userSettings = UserSettings()
//    @StateObject private var webManager = WebViewModel()         //менеждер webView
//    @StateObject private var vorEvent1Checker = VorPushEvent1VM()//менеджер 1 таба для воронки
    @State private var isScreenCaptured = false
    var body: some Scene {
        WindowGroup {
            VStack {
                if !isScreenCaptured {
                    NewTabView()
                }
            }
//            .onReceive(NotificationCenter.default.publisher(for: UIScreen.capturedDidChangeNotification)) { _ in
//                if webManager.screenBlock {
//                    isScreenCaptured = UIScreen.main.isCaptured
//                }
//            }
//            .screenshotProtected(isProtected: webManager.screenBlock)
            .environmentObject(userSettings)
//            .environmentObject(appDelegateObserver)
//            .environmentObject(webManager)
//            .environmentObject(vorEvent1Checker)
            .preferredColorScheme(.dark)
        }
    }
}
