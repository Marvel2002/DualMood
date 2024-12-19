//
//  FeedRepositoryImplem.swift
//  DualMood
//
//  Created by Matime Marvin on 18/12/2024.
//

enum APIError: Error {
    case cantFindData
    case decodingError
}

final class FeedRepositoryImplem: FeedRepository {
    private let unsplashService: UnsplashService

    init(unsplashService: UnsplashService) {
        self.unsplashService = unsplashService
    }

    func getFeed() async throws -> [Mood] {
        let photoUrls = try await unsplashService.getFeaturedPhotos()
        
        return photoUrls.map { url in
            Mood(photoUrl: url, isHappyMood: Bool.random())
        }
    }
}


