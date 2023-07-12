//
//  Serie.swift
//  NavigationBackportApp
//
//  Created by Rúben Antunes on 11/07/2023.
//

import Foundation

struct Serie: Identifiable, Hashable, Codable {
    let id = UUID()
    let title: String
    let year: String
    let description: String
    let actors: [String]

    init(title: String, year: String, description: String, actors: [String]) {
        self.title = title
        self.year = year
        self.description = description
        self.actors = actors
    }

    enum CodingKeys: CodingKey {
        case title
        case year
        case description
        case actors
    }
}
