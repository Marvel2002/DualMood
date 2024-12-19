//
//  SwipableView.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import PhotosUI
import SwiftUI

struct SwipableView: View {
    @State private var showToast = false
    @State private var offset: CGSize = .zero
    @State private var currentIndex: Int = 0
    @State private var moodIconOpacity: Double = 1
    @State private var showCommentField = false
    @State private var comment = ""
    @State private var pickerItem: PhotosPickerItem?
    
    var viewModel: FeedViewModel
    
    var body: some View {
        ZStack {
            if let nextMood = self.viewModel.moods.indices.contains(currentIndex + 1) ? self.viewModel.moods[currentIndex + 1] : nil {
                AsyncImage(url: URL(string: nextMood.photoUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .opacity(0.2)
                        .padding(15)
                } placeholder: {
                    ProgressView()
                }
                .opacity(offset.width == 0 ? 1 : 0)
                .animation(.easeInOut(duration: 0.3), value: offset.width)
            }
            if let currentMood = self.viewModel.moods.indices.contains(currentIndex) ? self.viewModel.moods[currentIndex] : nil {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: currentMood.photoUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 10)
                            .padding(30)
                    } placeholder: {
                        ProgressView()
                    }
                    .offset(x: offset.width, y: offset.height)
                    .rotationEffect(.degrees(Double(offset.width / 10)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                                moodIconOpacity = 0
                            }
                            .onEnded { gesture in
                                if abs(gesture.translation.width) > 100 {
                                    withAnimation(.easeInOut) {
                                        offset.width = gesture.translation.width > 0 ? 1000 : -1000
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation(.easeIn(duration: 0.5)) {
                                            moodIconOpacity = 1
                                        }
                                        nextImage()
                                    }
                                } else {
                                    withAnimation(.spring()) {
                                        moodIconOpacity = 1
                                        offset = .zero
                                    }
                                }
                            }
                    )
                    .animation(.spring(), value: offset)
                    Button(action: {
                        withAnimation {
                            showCommentField.toggle()
                        }
                    }) {
                        Image(systemName: "bubble.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.cyan)
                            .opacity(moodIconOpacity)
                            .animation(.easeIn(duration: 0.5), value: moodIconOpacity)
                        
                            .symbolEffect(.pulse)
                    }
                    .offset(x: -50, y: -50)
                }
                
                Image(systemName: "theatermasks.fill")
                    .symbolRenderingMode(.palette)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .foregroundStyle(.green.opacity(currentMood.isHappyMood ? 1 : 0.2), .red.opacity(currentMood.isHappyMood ? 0.2 : 1))
                    .opacity(moodIconOpacity)
                    .animation(.easeIn(duration: 0.5), value: moodIconOpacity)
                    .position(x: UIScreen.main.bounds.width / 2, y: 120)
            }
            
            
            AddMoodView {
                withAnimation {
                    showToast = true
                }
            }
            
            if showCommentField {
                CommentOverlayView(viewModel: CommentViewViewModel(getCommentsUserCase: GetCommentsUseCase(commentRepository: CommentRepositoryImplem())),
                                   isVisible: $showCommentField, didCommentHandler: {
                    self.triggerNextImage()
                })
                .transition(.opacity)
            }
            
            if showToast {
                ToastView(message: "Votre mood apparaitra dans la Feed après modération ☺️")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showToast = false
                        }
                    }
            }
        }
    }
    
    private func nextImage() {
        withAnimation(.easeInOut) {
            offset = .zero
            currentIndex = (currentIndex + 1) % self.viewModel.moods.count
        }
    }
    
    private func triggerNextImage() {
        withAnimation(.easeInOut) {
            currentIndex = (currentIndex + 1) % self.viewModel.moods.count
            offset = CGSize(width: 1000, height: 0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeInOut) {
                offset = .zero
            }
        }
    }
}
