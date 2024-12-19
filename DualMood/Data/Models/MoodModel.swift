//
//  MoodModel.swift
//  DualMood
//
//  Created by Matime Marvin on 18/12/2024.
//

import Foundation

public struct MoodModel: Identifiable {
    public let id = UUID()
    public let photoUrl: String
    public let isHappyMood: Bool
    
    init(from mood: Mood) {
        self.photoUrl = mood.photoUrl
        self.isHappyMood = mood.isHappyMood
    }
}
