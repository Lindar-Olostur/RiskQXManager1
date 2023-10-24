//
//  TabBarButton.swift
//  RiskQXManager
//


import SwiftUI

struct TabBarButton: View {
    let image: String
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                
                VStack {
                    if isSelected {
                        Divider()
                            .frame(height: 2)
                            .background(Color.gray)
                            .padding(.top, -6)
                            .offset(y: 6)
                    } else {
                        Divider()
                            .frame(height: 1)
                            .background(Color("grayText"))
                            .padding(.top, -6)
                            .offset(y: 6)
                    }
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
//                        .colorMultiply(isSelected ? Color("lightBlue") : .gray)
                    Text(NSLocalizedString(text, comment: ""))
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(isSelected ? Color(red: 0, green: 0.48, blue: 1) : Color(red: 0.41, green: 0.44, blue: 0.53))
                        .multilineTextAlignment(.center)
                }
                
            }.padding(.bottom)
        }
    }
}

#Preview {
    TabBarButton(image: "navolumeIcon", text: "lol", isSelected: true, action: {})
}

struct TabItem {
    let icon: String
    let text: LocalizedStringKey
}
