//
//  
//  LoadAnimationView.swift
//  RiskQXManager


import SwiftUI


struct CustomProgressBar: View {
    let circleCount = 12
    let animationDuration = 1.5

    @State private var animatedCircles: [Bool] = Array(repeating: false, count: 12)

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        ForEach(0..<circleCount) { index in
                            Circle()
                                .frame(width: 19, height: 19)
                                .foregroundColor(Color("AccentPrimary"))
                                .offset(getCirclePosition(for: index, in: geometry.size))
                                .opacity(animatedCircles[index] ? 0.0 : 1.0)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(width: 90, height: 90)
        .background(Color.clear) // Добавлен фон
        .onAppear {
            startAnimation()
        }
    }


    func getCirclePosition(for index: Int, in size: CGSize) -> CGSize {
        let angle = Double(index) / Double(circleCount) * 2.0 * .pi
        let radius = min(size.width, size.height) / 2.0

        let x = cos(angle) * Double(radius)
        let y = sin(angle) * Double(radius)

        return CGSize(width: x, height: y)
    }

    func startAnimation() {
        for index in 0..<animatedCircles.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (animationDuration / Double(circleCount))) {
                withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                    animatedCircles[index] = true
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        CustomProgressBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



