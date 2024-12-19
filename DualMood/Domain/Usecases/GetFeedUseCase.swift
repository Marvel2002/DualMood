//
//  GetFeedUseCase.swift
//  DualMood
//
//  Created by Matime Marvin on 18/12/2024.
//

import Combine
import Foundation

class GetFeedUseCase {
    private let feedRepository: FeedRepository

    init(feedRepository: FeedRepository) {
        self.feedRepository = feedRepository
    }

    func execute() async throws -> [Mood] {
        try await feedRepository.getFeed()
    }
}
