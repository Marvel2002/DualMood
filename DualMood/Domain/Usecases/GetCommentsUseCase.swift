//
//  GetCommentsUseCase.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

struct GetCommentsUseCase {
    private let commentRepository: CommentRepository

    init(commentRepository: CommentRepository) {
        self.commentRepository = commentRepository
    }

    func execute() async throws -> [Comment] {
        await commentRepository.getComments()
    }
}
