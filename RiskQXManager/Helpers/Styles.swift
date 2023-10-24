//
//  
//  Styles.swift
//  RiskQXManager
//

//

import Foundation
import SwiftUI
import Combine

struct BigButton: ButtonStyle {
    var backgroundColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .customText()
            .padding()
            .background(configuration.isPressed ? Color(red: 0.29, green: 0.33, blue: 0.43) : backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(8)
            .animation(.easeIn, value: 5)
//            .opacity(configuration.isPressed ? 0.5 : 1)
            .padding(.horizontal)
            .padding(.bottom)
        }
}

struct CustomText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Manrope-Regular", size: 16))
    }
}
extension View {
    func customText() -> some View {
        self.modifier(CustomText())
    }
}

//-------hide keyboard
extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}
// реализуется через onTapGesture на коренвой View
//    .onTapGesture {
//          self.endTextEditing()
//    }
