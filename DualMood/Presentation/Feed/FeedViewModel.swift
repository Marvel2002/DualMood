//
//  FeedViewModel.swift
//  DualMood
//
//  Created by Matime Marvin on 18/12/2024.
//

import Combine
import Foundation
import SwiftUICore

@MainActor
class FeedViewModel: ObservableObject {
    @Published var currentImageIndex = 0
    @Published var moods: [MoodModel] = []
    @Published var errorMessage: String?
    private let getFeedUseCase: GetFeedUseCase

    init(getFeedUseCase: GetFeedUseCase) {
        self.getFeedUseCase = getFeedUseCase
    }

    func loadFeed() async {
        errorMessage = nil

        do {
            let fetchedMoods = try await getFeedUseCase.execute()
            moods = fetchedMoods.map { MoodModel(from: $0) }
        } catch {
            errorMessage = "Failed to load feed: \(error.localizedDescription)"
        }
    }
    
    func addChoosenPhoto(imageURL: URL?, isHappyMood: Bool) {
        guard let imageURL else {
            return
        }
        let mood = Mood(photoUrl: imageURL.absoluteString, isHappyMood: isHappyMood)
        let newMood = MoodModel(from: mood)
        self.moods.insert(newMood, at: currentImageIndex)
    }

    func getNextPicture() {
        currentImageIndex += 1
    }
}
