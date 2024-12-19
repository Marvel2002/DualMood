//
//  Comment.swift
//  DualMood
//
//  Created by Matime Marvin on 19/12/2024.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: Int
    let username: String
    let comment: String
    let mood: String
    let date: String
}
