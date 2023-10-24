//
//  VolumeSettingsView.swift
//  RiskQXManager
//


import SwiftUI

struct VolumeSettingsView: View {
    @EnvironmentObject var userSettings: UserSettings
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                VStack {
                    ZStack {
                        Text("Volume")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        HStack {
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Back")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
                                    .padding(.leading, 16)
                            })
                            Spacer()
                        }
                    }
                    .padding(.top, 11)
                    VStack {
                        ForEach(userSettings.volumePairs.indices) { index in
                            let pair = userSettings.volumePairs[index]
                            VStack {
                                HStack {
                                    Image(pair.flags)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                    Text(pair.pair)
                                        .font(.system(size: 14))
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Toggle(isOn: $userSettings.volumePairs[index].isEnabled) {
                                        Text("")
                                    }
                                }
                                .padding(.top, index == 0 ? 10 : 0)
                                .padding(.bottom, index == 5 ? 10 : 0)
                                .padding(.horizontal, 16)
                                if index < 5 {
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(Color("bg"))
                                        .padding(.bottom, 5)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(Color(red: 0.21, green: 0.22, blue: 0.28))

                    .cornerRadius(20)
                    .shadow(color: Color(red: 0.09, green: 0.1, blue: 0.16), radius: 20, x: 0, y: 7)
                    .padding()
                    .padding(.top)
                    Spacer()
                }
                    .onDisappear(perform: {
                        userSettings.saveUserToUserDefaults()
                    })
            )
    }
}

#Preview {
    VolumeSettingsView()
        .environmentObject(UserSettings())
}
