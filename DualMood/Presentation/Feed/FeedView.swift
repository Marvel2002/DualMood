//
//  ContentView.swift
//  DualMood
//
//  Created by Matime Marvin on 17/12/2024.
//

import Combine
import SwiftUI

struct FeedView: View {
    @ObservedObject private var viewModel: FeedViewModel
    @State private var showCommentField = false
    
    init(viewModel: FeedViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            if viewModel.moods.isEmpty {
                ProgressView("Loading...")
            } else {
                SwipableView(viewModel: viewModel)
            }
        }
        .onAppear {
            Task {
                await viewModel.loadFeed()
            }
        }
    }
}
