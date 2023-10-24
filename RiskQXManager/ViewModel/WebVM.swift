////
////  
//  WebVM.swift
//  RiskQXManager
//

//import Foundation
//import Combine
//import FirebaseCore
//import Firebase
//import FirebaseDatabase
//import AppsFlyerLib
//import Network
//import OneSignal
//
//class WebViewModel: ObservableObject {
//
//    @Published var view = MyWebView(urlString: "http://google.com")
//    @Published var isLoading = true //show view with loading animation
//
//    // ask server to enter
//    var version: String = "1" // change for every new version
//    var appId = "app.qxquiz.com" // change for every new app
//    @Published var partnerLink = "" // show in WebView
//    var askLink: String
//    var appsFlyerId: String
//    var serverResponse = 0 {
//        didSet {
//            isLoading = false
//        }
//    }
//    var successEnter = false
//
//    // asking for events
//    var isNotFirstLaunch: Bool = false
//    var num = 0
//    private var askIsPaused = false
//    @Published var event0 = false
//    @Published var event1 = false
//
//    //utility
//    private var cancellables = Set<AnyCancellable>()
//    var ref: DatabaseReference!
//
//    @Published var screenBlock = true
//
//    init() {
//        isNotFirstLaunch = UserDefaults.standard.bool(forKey: "NotFirstLaunchKey")
//        if !isNotFirstLaunch {
//            OneSignal.sendTags(["reg": "false", "dep": "false"])
//        }
//        appsFlyerId = AppsFlyerLib.shared().getAppsFlyerUID()
//        ref = Database.database().reference()
//        askLink = "http://my.qxquiz.com/deviceStatus?clickId=\(appsFlyerId)&siteId=\(appId)"
//        fetchScreenBlock()
//    }
//
//    func fetchScreenBlock() {
//        ref.child("screenBlock").getData { [weak self] error, snapshot in
//            guard let self = self else { return }
//
//            if let error = error {
//                print("Ошибка при получении данных: \(error)")
//                self.screenBlock = true
//            } else {
//                if let value = snapshot?.value as? Bool {
//                    self.screenBlock = value
//                } else {
//                    self.screenBlock = true
//                }
//            }
//        }
//    }
//
//    func askServer() {
//        //get ling from Firebase
//        ref.child("enabled_\(version)").getData { [weak self] error, snapshot in
//            guard let self = self else { return }
//            if let error = error {
//                print("Ошибка 1 при получении данных: \(error)")
//                serverResponse = 0
//                isLoading = false
//            } else {
//                if let value = snapshot?.value as? Bool, value {
//                    self.ref.child("string_\(version)").getData { [weak self] error, snapshot in
//                        guard let self = self else { return }
//                        if let error = error {
//                            print("Ошибка 2 при получении данных: \(error)")
//                            serverResponse = 0
//                            isLoading = false
//                        } else {
//                            if let value = snapshot?.value as? String {
//                                appsFlyerId = AppsFlyerLib.shared().getAppsFlyerUID()
//                                self.partnerLink = "\(value)?clickId=\(appsFlyerId)&siteId=\(appId)"
//                                print("Get partnerLink from DB: \(partnerLink)")
//                                view = MyWebView(urlString: partnerLink)
//                                performGetRequest()
//                            } else {
//                                print("Значение узла 'strings' не является строкой или отсутствует.")
//                                serverResponse = 0
//                                isLoading = false
//                            }
//                        }
//                    }
//                } else {
//                    serverResponse = 0
//                    isLoading = false
//                }
//            }
//        }
//        // start ask server
//        func performGetRequest() {
//                appsFlyerId = AppsFlyerLib.shared().getAppsFlyerUID()
//                let link = "https://local.qxquiz.com/option.php?ip=\(getIP())&name=\(getDeviceName())&systemName=\(getSystemName())&systemVersion=\(getSystemVersion())&model=\(getDeviceModel())"
//                //print(link)
//                guard let url = URL(string: link) else {
//                    print("Invalid URL")
//                    serverResponse = 0
//                    isLoading = false
//                    return
//                }
//
//                URLSession.shared.dataTaskPublisher(for: url)
//                    .map { $0.data }
//                    .receive(on: DispatchQueue.main)
//                    .sink { completion in
//                        if case let .failure(error) = completion {
//                            print("Error: \(error.localizedDescription)")
//                            self.serverResponse = 0
//                            self.isLoading = false
//                        }
//                    } receiveValue: { data in
//                        if let responseString = String(data: data, encoding: .utf8) {
//                            //print("Response: \(responseString)")
//                            self.serverResponse = Int(responseString) ?? 0
//                            self.successEnter = true
//                            self.startPolling()
//                        }
//                    }
//                    .store(in: &cancellables)
//            // get data about user
//            func getIP() -> String {
//                guard let url = URL(string: "https://api.ipify.org/?format=json") else {
//                    print("Invalid URL")
//                    return ""
//                }
//
//                var ipAddress = ""
//                let semaphore = DispatchSemaphore(value: 0)
//
//                URLSession.shared.dataTask(with: url) { (data, response, error) in
//                    defer {
//                        semaphore.signal()
//                    }
//
//                    if let error = error {
//                        print("Error: \(error.localizedDescription)")
//                        return
//                    }
//
//                    if let data = data {
//                        do {
//                            let json = try JSONSerialization.jsonObject(with: data, options: [])
//                            if let ip = (json as? [String: Any])?["ip"] as? String {
//                                ipAddress = ip
//                            }
//                        } catch {
//                            print("Error parsing JSON: \(error.localizedDescription)")
//                        }
//                    }
//                }.resume()
//
//                _ = semaphore.wait(timeout: .distantFuture)
//                return ipAddress
//            }
//            func getSystemName() -> String {
//                let systemName = UIDevice.current.systemName
//                return systemName
//            }
//            func getSystemVersion() -> String {
//                return UIDevice.current.systemVersion
//            }
//            func getDeviceModel() -> String {
//                return UIDevice.current.model
//            }
//            func getDeviceName() -> String {
//                UIDevice.current.name.replacingOccurrences(of: " ", with: "_")
//            }
//        }
//    }
////----------------------------------------------------------------------
////    func printCurrentTime() {
////        let now = Date()
////        let formatter = DateFormatter()
////        formatter.timeStyle = .medium
////        let currentTime = formatter.string(from: now)
////        print("Current time: \(currentTime)")
////    }
////----------------------------------------------------------------------
//    func startPolling() {
//        print("start polling")
//        num = 20
//        var del = 0
//        if !isNotFirstLaunch {
//            UserDefaults.standard.set(true, forKey: "NotFirstLaunchKey")
//            num = 40
//            del = 60
//        } else {
//            num = 20
//            del = 0
//        }
//
//        Just(())
//            .delay(for: .seconds(del), scheduler: DispatchQueue.main)
//            .flatMap { _ in
//                Timer.publish(every: 15, on: .main, in: .common)
//                    .autoconnect()
//                    .prefix(self.num)
//            }
//            .sink { [weak self] _ in
//                guard let self = self else { return }
//                self.printCurrentTime()
//
//                if !self.askIsPaused {
//                    self.sendRequestToServer()
//                    self.num -= 1
//                }
//            }
//            .store(in: &cancellables)
//    }
//
//    func pausePolling() {
//        print("paused polling")
//        askIsPaused = true
//    }
//
//    func resumePolling() {
//        print("resumes polling")
//        askIsPaused = false
//    }
//
//    func stopPolling() {
//        print("stop polling")
//        cancellables.forEach { $0.cancel() }
//        cancellables.removeAll()
//    }
//
//    func sendRequestToServer() {
//        print(askLink)
//        URLSession.shared.dataTaskPublisher(for: URL(string: askLink)!)
//            .map { $0.data }
//            .decode(type: EventResponse.self, decoder: JSONDecoder())
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("Request completed successfully.")
//                case .failure(let error):
//                    print("Request failed with error: \(error.localizedDescription)")
//                }
//            } receiveValue: { [weak self] response in
//                guard let self = self else { return }
//                DispatchQueue.main.async {
//                    print("current num: \(self.num)")
//                    self.event0 = response.registration
//                    self.event1 = response.firstReplenishment
//                    if self.event0 == true && self.event1 == true {
//                        self.stopPolling()
//                    }
//                }
//            }
//            .store(in: &cancellables)
//    }
//}
//
