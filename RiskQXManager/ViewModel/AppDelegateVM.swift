////
////  
//  AppDelegateVM.swift
//  RiskQXManager
//

////
//
//import Foundation
//import AppsFlyerLib
//import OneSignal
//import Firebase
//import FirebaseCore
//import FirebaseAnalytics
//import FirebaseCrashlytics
//
//class FirebaseManager {
//    let database: Database
//
//    init() {
//        database = Database.database()
//    }
//}
//
////AppDelegate для всех SDK
//class AppDelegate: NSObject, UIApplicationDelegate {
//    
//    static var shared = AppDelegate()
//    
//    var showEvent3: Bool = false {
//        didSet {
//            NotificationCenter.default.post(name: Notification.Name("showEvent3"), object: showEvent3)
//        }
//    }
//    var showEvent2: Bool = false {
//        didSet {
//            NotificationCenter.default.post(name: Notification.Name("showEvent2"), object: showEvent2)
//        }
//    }
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//
//        // AppsFlyer integration
//        AppsFlyerLib.shared().appsFlyerDevKey = "njv9u7yAQCb7FXwneZNhPa"
//        AppsFlyerLib.shared().appleAppID = "6450137946"
//        // Uncomment the following line to see AppsFlyer debug logs
//        //AppsFlyerLib.shared().isDebug = true
//        
//        // OneSignal integration
//        OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_ERROR)
//        OneSignal.initWithLaunchOptions(launchOptions)
//        OneSignal.setAppId("686c7421-4389-42b6-9f20-9e8cdf9ad5d4")
//        let notificationOpenedBlock: OSNotificationOpenedBlock = { result in
//            // This block gets called when the user reacts to a notification received
//            let notification: OSNotification = result.notification
//            if let additionalData = notification.additionalData {
//                for (key, value) in additionalData {
//                    if let stringValue = value as? String {
//                        if key as! String == "Event3" && stringValue == "true" {
//                            self.showEvent3 = true
//                        } else if key as! String == "Event2" && stringValue == "true" {
//                            self.showEvent2 = true
//                        }
//                    }
//                }
//            }
//        }
//        OneSignal.setNotificationOpenedHandler(notificationOpenedBlock)
//        
//        // SceneDelegate support for AppsFlyer
//        NotificationCenter.default.addObserver(self, selector: #selector(sendLaunch), name: UIApplication.didBecomeActiveNotification, object: nil)
//        
//        return true
//    }
//    
//    @objc func sendLaunch() {
//        AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: 0)
//        AppsFlyerLib.shared().start()
//    }
//}
//
////для отправки даты из пушей в приложение
//class AppDelegateObserver: ObservableObject {
//    @Published var showEvent3: Bool = false
//    @Published var showEvent2: Bool = false
//    private var appDelegate: AppDelegate?
//
//    init() {
//        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
//        self.showEvent3 = self.appDelegate?.showEvent3 ?? false
//        self.showEvent2 = self.appDelegate?.showEvent2 ?? false
//    }
//}
