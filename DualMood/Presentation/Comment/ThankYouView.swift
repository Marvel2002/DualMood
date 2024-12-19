//
//  ThankYouView.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import SwiftUI

struct ThankYouView: View {
    @State private var dots = ""
    @State private var isActionTriggered = false
    let closeHandler: () -> Void
    
    let totalDots = 3
    
    var body: some View {
        VStack {
            Text("Merci pour ce message")
                .font(.title2)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                
            Text("\(dots)")
                .font(.title)
                .foregroundStyle(.white)
                .fontWeight(.bold)
        }
        .onAppear {
            animateDots()
        }
    }
    
    func animateDots() {
        withAnimation(Animation.linear(duration: 1).repeatCount(totalDots, autoreverses: false)) {
            for i in 1...totalDots {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                    dots = String(repeating: ".", count: i)
                    if i == totalDots {
                        closeHandler()
                    }
                }
            }
        }
    }
}
