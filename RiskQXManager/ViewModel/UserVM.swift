//
//  
//  UserVM.swift
//  RiskQXManager
//

//
import Foundation
import SwiftUI

//import FirebaseDatabase
//import Firebase

class UserSettings: ObservableObject {
    @Published var isOnboardingCompleted = UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
    @Published var sessionCount = UserDefaults.standard.integer(forKey: "sessionCount") {
        didSet {
            UserDefaults.standard.set(sessionCount, forKey: "sessionCount")
        }
    }
    
    @Published var selectedTab = 0
    
//    @Published var fbManager = FirebaseManager()
    @Published var event0 = false
    @Published var event1 = false
    
    @Published var showErrorAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var news = [
        New(name: "Deciphering DXY: The Dollar Index Explained", date: "09.10.2023", link: "https://www.tradingview.com/chart/BTCUSD/eMn2CKAf-Deciphering-DXY-The-Dollar-Index-Explained/"),
        New(name: "Why the Rich Get Richer and the Poor Get Poorer", date: "01.10.2023", link: "https://www.tradingview.com/chart/EURUSD/qM0X895N-Why-the-Rich-Get-Richer-and-the-Poor-Get-Poorer/"),
        New(name: "Crafting Your Path to Success: Developing a Winning Trading Plan", date: "04.10.2023", link: "https://www.tradingview.com/chart/XAUUSD/sq2bQogT-Crafting-Your-Path-to-Success-Developing-a-Winning-Trading-Plan/"),
        New(name: "Inflation: The Silent Wealth Eroder", date: "15.10.2023", link: "https://www.tradingview.com/chart/EURUSD/xknXwEuT-Inflation-The-Silent-Wealth-Eroder/"),
        New(name: "Unveiling the Iceberg Illusion of Success in Forex Trading", date: "25.09.2023", link: "https://www.tradingview.com/chart/BTCUSD/XW74sJFr-Unveiling-the-Iceberg-Illusion-of-Success-in-Forex-Trading/"),
        New(name: "Navigating the Rocky Road: The Hard Trade Journey", date: "17.10.2023", link: "https://www.tradingview.com/chart/BTCUSD/Bpi3dT7C-Navigating-the-Rocky-Road-The-Hard-Trade-Journey/"),
        New(name: "Unmasking the FOMO Effect in Trading", date: "12.10.2023", link: "https://www.tradingview.com/chart/EURUSD/f4SVajIA-Unmasking-the-FOMO-Effect-in-Trading/"),
        New(name: "Timing Your Success: How Long to Hold in Forex Trading", date: "27.09.2023", link: "https://www.tradingview.com/chart/XAUUSD/zhp7RUgZ-Timing-Your-Success-How-Long-to-Hold-in-Forex-Trading/"),
        New(name: "Learning from Mistakes: The Path to Trading Mastery", date: "13.10.2023", link: "https://www.tradingview.com/chart/BTCUSD/OQ6L3IOI-Learning-from-Mistakes-The-Path-to-Trading-Mastery/"),
        New(name: "The Only Reason You Need a TRADING PLAN", date: "23.09.2023", link: "https://www.tradingview.com/chart/EURUSD/njqHN1oq-The-Only-Reason-You-Need-a-TRADING-PLAN/"),
        New(name: "Discover The Main Difference Between Scalping, Day, Swing TRADES", date: "21.10.2023", link: "https://www.tradingview.com/chart/EURUSD/jtLMPLKK-Discover-The-Main-Difference-Between-Scalping-Day-Swing-TRADES/"),
    ]
    @Published var volumePairs = [VolumePair(pair: "AUD/USD", flags: "AUDUSD", isEnabled: true), VolumePair(pair: "GBP/USD", flags: "GBPUSD", isEnabled: true), VolumePair(pair: "CAD/CHF", flags: "CADCHF", isEnabled: true), VolumePair(pair: "USD/JPY", flags: "USDJPY", isEnabled: false), VolumePair(pair: "EUR/GBP", flags: "EURGBP", isEnabled: false), VolumePair(pair: "EUR/AUD", flags: "EURAUD", isEnabled: false)]
    @Published var widget = WebView(urlString: "https://www.tradingview.com/education/riskmanagement/")
    @Published var signalsList = [Signal(imageName: "AUDJPY", name: "AUD/JPY"), Signal(imageName: "AUDUSD", name: "AUD/USD"), Signal(imageName: "CADCHF", name: "CAD/CHF"), Signal(imageName: "CADJPY", name: "CAD/JPY"), Signal(imageName: "EURAUD", name: "EUR/AUD"), Signal(imageName: "EURCAD", name: "EUR/CAD"), Signal(imageName: "EURGBP", name: "EUR/GBP"), Signal(imageName: "EURUSD", name: "EUR/USD"), Signal(imageName: "GBPCHF", name: "GBP/CHF"), Signal(imageName: "GBPJPY", name: "GBP/JPY"), Signal(imageName: "GBPUSD", name: "GBP/USD"), Signal(imageName: "GBRCHF", name: "GBR/CHF"), Signal(imageName: "NZDJPY", name: "NZD/JPY"), Signal(imageName: "USDCAD", name: "USD/CAD"), Signal(imageName: "USDJPY", name: "USD/JPY")]
    @Published var history: [History] = []
    

    init() {
        loadUserFromUserDefaults()
        sessionCount += 1
    }
    deinit {
        saveUserToUserDefaults()
    }
    
    func resetToDefaultValues() {
        history = []
        event0 = false
        event1 = false
        volumePairs = [VolumePair(pair: "AUD/USD", flags: "AUDUSD", isEnabled: true), VolumePair(pair: "GBP/USD", flags: "GBPUSD", isEnabled: true), VolumePair(pair: "CAD/CHF", flags: "CADCHF", isEnabled: true), VolumePair(pair: "USD/JPY", flags: "USDJPY", isEnabled: false), VolumePair(pair: "EUR/GBP", flags: "EURGBP", isEnabled: false), VolumePair(pair: "EUR/AUD", flags: "EURAUD", isEnabled: false)]
    }
    
    private func loadUserFromUserDefaults() {
        if UserDefaults.standard.object(forKey: "event0") != nil {
            self.event0 = UserDefaults.standard.bool(forKey: "event0")
        }
        if UserDefaults.standard.object(forKey: "event1") != nil {
            self.event1 = UserDefaults.standard.bool(forKey: "event1")
        }
        if let volumeData = UserDefaults.standard.data(forKey: "volumes") {
            do {
                volumePairs = try JSONDecoder().decode([VolumePair].self, from: volumeData)
            } catch {
                print("not loaded volume pairs")
            }
        }
        if let historyData = UserDefaults.standard.data(forKey: "history") {
            do {
                history = try JSONDecoder().decode([History].self, from: historyData)
            } catch {
                print("not loaded history")
            }
        }
    }

    func saveUserToUserDefaults() {
        // Сохранение значений в UserDefaults
        UserDefaults.standard.set(event0, forKey: "event0")
        UserDefaults.standard.set(event1, forKey: "event1")
        do {
                let volumeData = try JSONEncoder().encode(volumePairs)
                UserDefaults.standard.set(volumeData, forKey: "volumes")
            } catch {
                print("not saved volume pairs")
            }
        do {
                let historyData = try JSONEncoder().encode(history)
                UserDefaults.standard.set(historyData, forKey: "history")
            } catch {
                print("not saved history")
            }
    }
}

