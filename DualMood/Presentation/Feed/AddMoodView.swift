//
//  AddMoodView.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import SwiftUI
import PhotosUI

struct AddMoodView: View {
    @State private var showSideButtons = false
    @State private var isLeftPickerPresented = false
    @State private var isRightPickerPresented = false
    @State private var selectedLeftPhoto: PhotosPickerItem?
    @State private var selectedRightPhoto: PhotosPickerItem?
    let completionAction: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                if showSideButtons {
                    Button(action: {
                        isLeftPickerPresented = true
                    }) {
                        Image(systemName: "theatermasks.fill")
                            .symbolRenderingMode(.palette)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.green, .red.opacity(0.2))
                    }
                    .transition(.scale.combined(with: .opacity))
                    .photosPicker(isPresented: $isLeftPickerPresented, selection: $selectedLeftPhoto)
                    .onChange(of: selectedLeftPhoto) { newItem in
                        completionAction()
                    }
                }
                
                Button(action: {
                    withAnimation {
                        showSideButtons.toggle()
                    }
                }) {
                    Text(Image(systemName: "plus.diamond.fill"))
                        .symbolEffect(.scale.up.byLayer, options: .nonRepeating)
                        .symbolRenderingMode(.hierarchical)
                        .font(.system(size: 60))
                }
                
                if showSideButtons {
                    Button(action: {
                        isRightPickerPresented = true
                    }) {
                        Image(systemName: "theatermasks.fill")
                            .symbolRenderingMode(.palette)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.green.opacity(0.2), .red)
                    }
                    .transition(.scale.combined(with: .opacity))
                    .photosPicker(isPresented: $isRightPickerPresented, selection: $selectedRightPhoto)
                    .onChange(of: selectedRightPhoto) { newItem in
                        completionAction()
                    }
                }
            }
        }.padding(.bottom, 50)
    }
}
