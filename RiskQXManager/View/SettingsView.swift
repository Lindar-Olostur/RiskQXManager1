//
//  SettingsView.swift
//  RiskQXManager
//


import SwiftUI

struct SettingsView: View {
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    VStack {
                        //HEADER
                        HStack {
                            Text("Settings")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 11)
                        }
                        .padding(.bottom)
                        VStack(spacing: 3) {
                            Button {
                                //
                            } label: {
                                HStack {
                                    Image("policyIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24)
                                    Text("Privacy Policy")
                                        .font(.system(size: 16))
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                            }
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color(red: 0.29, green: 0.33, blue: 0.43))
                            .cornerRadius(8, corners: [.topLeft, .topRight])
                            .offset(y: -8)
                            Button {
                                //
                            } label: {
                                HStack {
                                    Image("policyIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24)
                                    Text("Privacy Policy")
                                        .font(.system(size: 16))
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                            }
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color(red: 0.29, green: 0.33, blue: 0.43))
                            .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                            .offset(y: -8)
                        }
                        .padding()
                        Spacer()
                    }
                }
                )
    }
}

#Preview {
    SettingsView()
}
