//
//  DualMoodApp.swift
//  DualMood
//
//  Created by Matime Marvin on 17/12/2024.
//

import SwiftUI

@main
struct DualMoodApp: App {
    var body: some Scene {
        WindowGroup {
            MainGradientView {
                FeedView(viewModel: FeedViewModel(getFeedUseCase: GetFeedUseCase(feedRepository: FeedRepositoryImplem(unsplashService: UnsplashService()))))
                    .preferredColorScheme(.light)
            }
        }
    }
}
