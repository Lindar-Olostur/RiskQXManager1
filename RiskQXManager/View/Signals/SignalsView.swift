//
//  SignalsView.swift
//  RiskQXManager
//


import SwiftUI

struct SignalsView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var tab = 0
    @State var currentName = ""
    @State var currentFlags = ""
    @State var currentColumn = 0
    @State var currentRow = 0
    @State var isShowed = false
    @State var isDone = false
    @State private var isOverlayVisible = false
    @State var type = ""
    @State var date = ""
    @State var time = ""
    @State var persent = ""
    @State var isBuy = false
    
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    VStack {
                        //HEADER
                        HStack {
                            Text("Signals")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 11)
                        }
                        // MENU
                        HStack {
                            Button(action: {
                                userSettings.saveUserToUserDefaults()
                                tab = 0
                                isShowed = false
                                isDone = false
                                isOverlayVisible = false
                            }) {
                                Text("Signal")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(tab == 0 ? .white : Color(red: 0.61, green: 0.63, blue: 0.7))
                                    .padding(10)
                                    .background(tab == 0 ? Color("AccentPrimary") : Color(UIColor(red: 0, green: 0.48, blue: 1, alpha: 0.0)))
                                    .cornerRadius(10)
                            }
                            Button(action: {
                                userSettings.saveUserToUserDefaults()
                                tab = 1
                                isShowed = false
                                isDone = false
                                isOverlayVisible = false
                            }) {
                                Text("History")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(tab == 1 ? .white : Color(red: 0.61, green: 0.63, blue: 0.7))
                                    .padding(10)
                                    .background(tab == 1 ? Color("AccentPrimary") : Color(UIColor(red: 0, green: 0.48, blue: 1, alpha: 0.0)))
                                    .cornerRadius(10)
                            }
                        }
                        .padding(2)
                        .background(Color(red: 0.21, green: 0.22, blue: 0.28))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                        .padding(.top)
                        if tab == 0 {
                            VStack {
                                ScrollView {
                                    VStack {
                                        LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                                            ForEach(Array(userSettings.signalsList.enumerated()), id: \.element) { (index, signal) in
                                                Button {
                                                    let dateFormatter = DateFormatter()
                                                    dateFormatter.dateFormat = "dd.MM.yyyy"
                                                    date = dateFormatter.string(from: Date())
                                                    isOverlayVisible = true
                                                    isDone = false
                                                    currentName = signal.name
                                                    currentFlags = signal.imageName
                                                    currentColumn = (index+1)%3 == 0 ? 3 : (index+1)%3
                                                    currentRow = ((index)/3)+1
                                                    isShowed = false
                                                } label: {
                                                    VStack {
                                                        Image(signal.imageName)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 32, height: 32)
                                                        Text(signal.name)
                                                            .font(.system(size: 16))
                                                            .fontWeight(.medium)
                                                            .foregroundColor(.white)
                                                    }
                                                    .padding(12)
                                                    .frame(maxWidth: .infinity, alignment: .center)
                                                    .background(Color(red: 0.21, green: 0.22, blue: 0.28))
                                                    .cornerRadius(8)
                                                }
                                            }
                                        }
                                        .padding()
                                        if isOverlayVisible && !isShowed {
                                            Button {
                                                getHistory()
                                                isShowed = true
                                                isDone = true
                                            } label: {
                                                Text("Find new signal")
                                                    .font(.system(size: 16))
                                                    .fontWeight(.semibold)
                                            }
                                            .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                                        }
                                        if isDone && isShowed {
                                            Button {
                                                let history = History(imageName: currentFlags, name: currentName, time: time, persent: persent, isBuy: isBuy, type: "Long", date: date)
                                                userSettings.history.append(history)
                                                isShowed = false
                                                isDone = false
                                                isOverlayVisible = false
                                                userSettings.saveUserToUserDefaults()
                                            } label: {
                                                Text("Done")
                                                    .font(.system(size: 16))
                                                    .fontWeight(.semibold)
                                            }
                                            .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                                        }
                                    }
                                }
                            }
                        } else {
                            VStack(spacing: -3) {
                                ForEach(userSettings.history.indices) { index in
                                    let item = userSettings.history[index]
                                    SignalWindowView(tailIsHidden: true, column: .constant(0), name: .constant(item.name), flags: .constant(item.imageName), isShowed: .constant(true), type: .constant(item.type), date: .constant(item.date), time: .constant(item.time), persent: .constant(item.persent), isBuy: .constant(item.isBuy))
                                }
                            }
                            .padding()
                            .padding(.top, -4)
                            Spacer()
                        }
                    }
                    if isOverlayVisible {
                        VStack {
                            SignalWindowView(column: $currentColumn, name: $currentName, flags: $currentFlags, isShowed: $isShowed, type: $type, date: $date, time: $time, persent: $persent, isBuy: $isBuy )
                                .padding(.horizontal)
                                .offset(y: currentRow == 1 ? 30 : 0)
                                .offset(y: currentRow == 2 ? 120 : 0)
                                .offset(y: currentRow == 3 ? 212 : 0)
                                .offset(y: currentRow == 4 ? 303 : 0)
                                .offset(y: currentRow == 5 ? 394 : 0)
                            Spacer()
                        }
                    }
                }
            )
    }
    func getHistory() {
        isBuy = buyGenerate()
        if isBuy {
            type = "Long"
        } else {
            type = "Short"
        }
        time = generateRandomTime()
        persent = generateRandomGain()
    }
    func generateRandomTime() -> String {
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Генерация случайного числа от 5 до 10
        let randomMinutes = Int.random(in: 5...10)
        
        // Добавление случайного числа минут к текущему времени
        if let newDate = calendar.date(byAdding: .minute, value: randomMinutes, to: currentDate) {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: newDate)
        } else {
            return "Ошибка при генерации времени"
        }
    }
    func generateRandomGain() -> String {
        let value = Double.random(in: 0.003...0.05)
        if isBuy {
            return "+\(String(format: "%.1f", value*100))%"
        } else {
            return "-\(String(format: "%.1f", value*100))%"
        }
    }
    func buyGenerate() -> Bool {
        return Bool.random()
    }
}

#Preview {
    SignalsView()
        .environmentObject(UserSettings())
}
