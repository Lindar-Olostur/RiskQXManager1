//
//  VolumeView.swift
//  RiskQXManager
//


import SwiftUI
import WebKit

struct VolumeView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var tab = 0
    @State private var pressedIndex = 0
    @State private var goToSettings = false
    @State private var isShowingWebView = false
    @State var link = 0
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack {
                        Text("Volume")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 11)
                    }
                    HStack {
                        Button(action: {
                            tab = 0
                        }) {
                            Text("Main")
                                .font(.system(size: 16))
                                .frame(maxWidth: .infinity)
                                .foregroundColor(tab == 0 ? .white : Color(red: 0.61, green: 0.63, blue: 0.7))
                                .padding(10)
                                .background(tab == 0 ? Color("AccentPrimary") : Color(UIColor(red: 0, green: 0.48, blue: 1, alpha: 0.0)))
                                .cornerRadius(10)
                        }
                        Button(action: {
                            tab = 1
                        }) {
                            Text("Risk Management")
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
                    
                    VStack {
                        VStack {
                            if tab == 0 {
                                VStack {
                                    ScrollView(showsIndicators: false) {
                                        VStack {
                                            HeatwaveMeter(value: userSettings.volumePairs[pressedIndex].meter, image: userSettings.volumePairs[pressedIndex].flags, text: userSettings.volumePairs[pressedIndex].pair)
                                            VStack {
                                                ForEach(Array(userSettings.volumePairs.enumerated()), id: \.element.id) { index, pair in
                                                    if pair.isEnabled {
                                                        Button(action: {
                                                            pressedIndex = index
                                                        }, label: {
                                                            VolatilityMeter(persent: pair.persent, pair: pair.pair, flags: pair.flags)
                                                                .padding(.bottom)
                                                        })
                                                    }
                                                }

                                                Button {
                                                    goToSettings.toggle()
                                                } label: {
                                                    Text("Settings")
                                                        .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                                                        .padding()
                                                        .frame(maxWidth: .infinity)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .stroke(Color(red: 0, green: 0.48, blue: 1), lineWidth: 2)
                                                        )
                                                }

                                            }
                                            .padding()
                                            .background(Color(red: 0.21, green: 0.23, blue: 0.3))
                                            .cornerRadius(8)
                                            .padding(.top)
                                        }
                                    }
                                }
                                .padding()
                            }
                            
                            if tab == 1 {
                                ScrollView {
                                    VStack(alignment: .leading) {
                                        ForEach(userSettings.news.indices) { index in
                                            let new = userSettings.news[index]
                                            Button {
                                                link = index
                                                isShowingWebView = true
                                            } label: {
                                                VStack {
                                                    HStack {
                                                        Text(new.name)
                                                            .font(.system(size: 16))
                                                            .fontWeight(.bold)
                                                            .multilineTextAlignment(.leading)
                                                            .foregroundColor(.white)
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Image("newsMark")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 42)
                                                        Text(new.date)
                                                            .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
                                                            .font(.system(size: 10))
                                                        Spacer()
                                                    }
                                                }
                                                .padding(.horizontal, 4)
                                                .padding(.vertical, 6)
                                            }

                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
                    .fullScreenCover(isPresented: $isShowingWebView) {
                        VStack {
                            HStack {
                                Button("Back") {
                                    isShowingWebView = false
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            WebView(urlString: userSettings.news[link].link)
                        }
                    }
                    .fullScreenCover(isPresented: $goToSettings) {
                        VolumeSettingsView(userSettings: _userSettings)
                    }
                    .onDisappear {
                        userSettings.saveUserToUserDefaults()
                    }
                    .onAppear {
                        Task {
                            await updatePersentsAsync()
                        }
                    }
            )
    }
    func updatePersentsAsync() async {
        while true {
            await Task.sleep(5 * 1_000_000_000) // Пауза в 5 секунд
            let isPlus = Bool.random()
            let int = Double.random(in: 0.0...2.5)
            if isPlus {
                userSettings.volumePairs[pressedIndex].meter += int
                if userSettings.volumePairs[pressedIndex].meter > 9.9 {
                    userSettings.volumePairs[pressedIndex].meter = 9.9
                }
            } else {
                userSettings.volumePairs[pressedIndex].meter -= int
                if userSettings.volumePairs[pressedIndex].meter < 0.0 {
                    userSettings.volumePairs[pressedIndex].meter = 0.1
                }
            }
        }
    }
}

#Preview {
    VolumeView()
        .environmentObject(UserSettings())
}
