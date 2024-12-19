//
//  FeedRepository.swift
//  DualMood
//
//  Created by Matime Marvin on 18/12/2024.
//

import Foundation

protocol FeedRepository {
    func getFeed() async throws -> [Mood]
}
