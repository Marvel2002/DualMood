//
//  CommentOverlayView.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import SwiftUI

struct CommentOverlayView: View {
    @ObservedObject var viewModel: CommentViewViewModel
    @Binding var isVisible: Bool
    @State var didSubmitComment = false
    let didCommentHandler: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        isVisible = false
                    }
                }
            
            VStack {
                VStack {
                    ForEach(self.viewModel.comments) { comment in
                        VStack(alignment: .leading, spacing: 3) {
                            Text("User anonyme #\(comment.id)")
                                .font(.system(size: 13, weight: .regular))
                                .foregroundColor(.gray)
                            ChatMessageView(message: comment.comment)
                        }
                    }
                }
                if didSubmitComment {
                    ThankYouView(closeHandler: {
                        withAnimation {
                            isVisible = false
                            didCommentHandler()
                        }
                    })
                } else {
                    CommentFieldView(comment: $viewModel.comment) {
                        withAnimation {
                            self.viewModel.submitComment()
                            didSubmitComment = true
                        }
                    } closeHandler: {
                        withAnimation {
                            isVisible = false
                        }
                    }
                }
            }
            .padding(30)
            .background(
                LinearGradient(stops: [.init(color: .black, location: 0.0),
                                       .init(color: Color.init(hex: 0x080F37), location: 0.4),
                                       .init(color: Color.init(hex: 0x080F37), location: 0.8),
                                       .init(color: .black, location: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            .shadow(radius: 10)
        }
        .onAppear {
            Task {
                await viewModel.loadComments()
            }
        }
    }
}
