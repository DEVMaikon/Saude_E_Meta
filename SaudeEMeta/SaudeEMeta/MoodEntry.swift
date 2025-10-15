//
//  MoodEntry.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 20/05/25.
//

import Foundation

struct MoodEntry: Identifiable, Codable {
    let id: UUID
    let mood: String
    let note: String
    let date: Date

    init(id: UUID = UUID(), mood: String, note: String, date: Date) {
        self.id = id
        self.mood = mood
        self.note = note
        self.date = date
    }
}
