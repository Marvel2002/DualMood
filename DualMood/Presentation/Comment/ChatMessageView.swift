//
//  ChatMessageView.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import SwiftUI

struct ChatMessageView: View {
    let message: String
    var body: some View {
        HStack {
            bubbleView
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
    
    var bubbleView: some View {
        Text(message)
            .font(.system(size: 17))
            .padding(10)
            .background(Color(white: 0.9))
            .clipShape(.rect(cornerRadius: 20))
    }
}
