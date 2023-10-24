//
//  Onboarding9View.swift
//  RiskQXManager
//


import SwiftUI
import StoreKit
//import ScreenshotPreventingSwiftUI

struct Onboarding9View: View {
    //    @EnvironmentObject var webManager: WebViewModel
    @State private var goToOnboarding10 = false
    @State private var progress: Double = 0.0
    @State private var isLoading: Bool = false
    var body: some View {
        ZStack {
            OnboardingTemplate()
            VStack {
                Text("Help us to improve the app")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Spacer()
                VStack(alignment: .center, spacing: 12) {
                    Image("photo")
                        .resizable()
                        .frame(width: 120, height: 120)
                    Text("Philip Whang")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    HStack(spacing: 1) {
                        ForEach(1...5, id: \.self) { index in
                            Image("star")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    Text("I love this platform. It’s easy to use, \n fast and accurate. Try the demo first...see for self!")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.21, green: 0.22, blue: 0.28))
                .cornerRadius(20)
                .shadow(color: Color(red: 0.09, green: 0.1, blue: 0.16), radius: 20, x: 0, y: 7)
                .padding(.horizontal, 16)
                .padding(.top, 60)
//                Spacer()
//                Text("\(Int(progress * 100))%")
//                    .font(.system(size: 24))
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                ProgressBarView(progress: $progress)
//                    .frame(height: 10)
//                    .padding(.horizontal)
                Spacer()
                Button {
                    goToOnboarding10.toggle()
                } label: {
                    Text("Show")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                .buttonStyle(BigButton(backgroundColor: Color(red: 0, green: 0.48, blue: 1)))
                .padding(.bottom)
            }
        }
        .fullScreenCover(isPresented: $goToOnboarding10) {
            Onboarding10View()
        }
        .onAppear {
            startLoading()
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
//        .screenshotProtected(isProtected: webManager.screenBlock)
    }
    func startLoading() {
        let speed = 0.03 // change speed loader
        isLoading = true
        
        // Имитация процесса загрузки
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
            progress += 0.01
            
            if progress >= 1.0 {
                timer.invalidate()
                isLoading = false
            }
        }
    }
}

#Preview {
    Onboarding9View()
}
