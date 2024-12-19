//
//  ToastView.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import SwiftUI

struct ToastView: View {
    var message: String
    @State private var isVisible = true
    
    var body: some View {
        VStack {
            if isVisible {
                Text(message)
                    .font(.body)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isVisible = false
                            }
                        }
                    }
            }
        }
        .padding(.top, 50)
    }
}
