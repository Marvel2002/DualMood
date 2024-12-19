//
//  CommentModel.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import Foundation

public struct CommentModel: Identifiable {
    public let id: Int
    public let username: String
    public let comment: String
    public let mood: String
    public let date: String
    
    init(from comment: Comment) {
        self.id = comment.id
        self.username = comment.username
        self.comment = comment.comment
        self.mood = comment.mood
        self.date = comment.date
    }
}
