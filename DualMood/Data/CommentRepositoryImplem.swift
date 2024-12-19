//
//  CommentRepositoryImplem.swift
//  DualMood
//
//  Created by Matime Marvin on 18/12/2024.
//

import Foundation

final class CommentRepositoryImplem: CommentRepository {
    func getComments() async -> [Comment] {
        guard let url = Bundle.main.url(forResource: "comments", withExtension: "json") else {
            print("Failed to locate comments.json in bundle.")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let comments = try JSONDecoder().decode([Comment].self, from: data)
            let randomComments = comments.shuffled().prefix(Int.random(in: 1...3))
            return Array(randomComments)
        } catch {
            print("Failed to load or decode JSON: \(error)")
            return []
        }
    }
    
    func postComment(comment: String) async -> Bool {
        return true
    }
}
