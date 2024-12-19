//
//  CommentFieldView.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import SwiftUI

struct CommentFieldView: View {
    @Binding var comment: String
    let didCommentHandler: () -> Void
    let closeHandler: () -> Void
    
    var body: some View {
        TextField("Ajouter un court message sur ce mood...", text: $comment)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding([.leading, .trailing])
        
        Button(action: {
            didCommentHandler()
        }) {
            Image(systemName: "paperplane.circle.fill")
                .symbolRenderingMode(.palette)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundStyle(.green, .red.opacity(0.2))
        }
        .padding(.top)
    }
}
