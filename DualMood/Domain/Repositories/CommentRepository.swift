//
//  CommentRepository.swift
//  DualMood
//
//  Created by Matime Marvin on 18/12/2024.
//

import Foundation

protocol CommentRepository {
    func getComments() async -> [Comment]
    func postComment(comment: String) async -> Bool
}
