//
//  CommentViewViewModel.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import Combine
import SwiftUI

@MainActor
final class CommentViewViewModel: ObservableObject {
    @Published var comments: [CommentModel] = []
    @Published var comment: String = ""
    @Published var errorMessage: String?
    private let getCommentsUserCase: GetCommentsUseCase
    
    init(getCommentsUserCase: GetCommentsUseCase) {
        self.getCommentsUserCase = getCommentsUserCase
    }
    
    func submitComment() {
        let comment = Comment(id: Int.random(in: 100...200), username: "", comment: comment, mood: "happy", date: Date().description)
        let newComment = CommentModel.init(from: comment)
        withAnimation {
            self.comments.append(newComment)
        }
    }
    
    func loadComments() async {
        do {
            let comments = try await getCommentsUserCase.execute()
            self.comments = comments.map { CommentModel(from: $0) }
        } catch {
            errorMessage = "Failed to load feed: \(error.localizedDescription)"
        }
    }
}
