//
//  SignalWindowView.swift
//  RiskQXManager
//


import SwiftUI

struct SignalWindowView: View {
    var tailIsHidden = false
    @Binding var column: Int
    @Binding var name: String
    @Binding var flags: String
    @Binding var isShowed: Bool
    @Binding var type: String
    @Binding var date: String
    @Binding var time: String
    @Binding var persent: String
    @Binding var isBuy: Bool
    var body: some View {
        VStack {
            // upper part
            HStack {
                Image(flags)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                VStack(alignment: .leading) {
                    Text(date)
                        .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
                        .font(.system(size: 10))
                    Text(name)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Text("Signal type")
                        .foregroundColor(Color(red: 0.61, green: 0.63, blue: 0.7))
                        .font(.system(size: 10))
                    if type != "" {
                        Text(type)
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.vertical,2)
                    } else {
                        Image("frame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                            .scaleEffect(1.25)
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            .padding(.bottom, 8)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(red: 0.29, green: 0.33, blue: 0.43))
            .cornerRadius(8, corners: [.topLeft, .topRight])
            .offset(y: 6)
            // line
            Rectangle()
                .frame(height: 3)
                .foregroundColor(Color("bg"))
                .padding(.top, -2)
            // bottom
            if !isShowed {
                HStack {
                    Image("frame")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .scaleEffect(1.25)
                        .padding(.leading)
                    Spacer()
                    Image("frame")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .scaleEffect(1.25)
                    Spacer()
                    Image("frame")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .scaleEffect(1.25)
                        .padding(.trailing)
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(red: 0.29, green: 0.33, blue: 0.43))
                .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                .offset(y: -8)
            } else {
                HStack {
                    Text(time)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.leading)
                    Spacer()
                    Text(persent)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(isBuy ? Color(red: 0.35, green: 0.78, blue: 0.31) : Color(red: 0.9, green: 0.34, blue: 0.23))
                    Spacer()
                    if isBuy {
                        HStack {
                            Text("Buy")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.35, green: 0.78, blue: 0.31))
                            Image("greenArrows")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .offset(x: -8)
                        }
                        .padding(.leading)
                    } else {
                        HStack {
                            Text("Sell")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.9, green: 0.34, blue: 0.23))
                            Image("redArrows")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .offset(x: -8)
                        }
                        .padding(.leading)
                    }
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(red: 0.29, green: 0.33, blue: 0.43))
                .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                .offset(y: -8)
            }
            // tail
            if !tailIsHidden {
                HStack {
                    if column == 3 {
                        Spacer()
                        Image("arrowBox")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 34)
                            .offset(x: -15 , y: -12)
                    }
                    if column == 2 {
                        Image("arrowBox")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 34)
                            .offset(y: -12)
                    }
                    if column == 1 {
                        Image("arrowBox")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 34)
                            .offset(x: 15 , y: -12)
                        Spacer()
                    }
                }
                .offset(y: -8)
            }
        }
    }
    
}

#Preview {
    SignalWindowView(column: .constant(1), name: .constant("EUR/GBP"), flags: .constant("EURGBP"), isShowed: .constant(true), type: .constant(""), date: .constant("14.10.1899"), time: .constant("12:45"), persent: .constant("+5.6%"), isBuy: .constant(true))
}
