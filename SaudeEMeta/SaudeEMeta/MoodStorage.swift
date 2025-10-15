//
//  MoodStorage.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 20/05/25.
//

import Foundation

struct MoodStorage {
    private static let key = "mood_entries"

    static func save(entries: [MoodEntry]) {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    static func load() -> [MoodEntry] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let entries = try? JSONDecoder().decode([MoodEntry].self, from: data) else {
            return []
        }
        return entries
    }
}

