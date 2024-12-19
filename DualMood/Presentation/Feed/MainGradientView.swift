//
//  MainGradientView.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import SwiftUI

struct MainGradientView<Content>: View where Content: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [.init(color: .black, location: 0.0),
                                   .init(color: Color.init(hex: 0x080F37), location: 0.4),
                                   .init(color: Color.init(hex: 0x080F37), location: 0.8),
                                   .init(color: .black, location: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
            content
        }
        .ignoresSafeArea()
    }
}
