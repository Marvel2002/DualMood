//
//  PostCommentUseCase.swift
//  DualMood
//
//  Created by Matime Marvin on 18/12/2024.
//

import Combine
import Foundation

struct PostCommentUseCase {
    private let commentRepository: CommentRepository

    init(commentRepository: CommentRepository) {
        self.commentRepository = commentRepository
    }

    func execute(comment: String) async throws -> Bool {
        await commentRepository.postComment(comment: comment)
    }
}
