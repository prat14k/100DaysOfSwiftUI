//
//  Model.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 03/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import Foundation

struct Astronaut: Codable {
    let id, name, description: String
}

struct Mission: Codable, Identifiable {
    struct Crew: Codable {
        let id, role: String

        enum CodingKeys: String, CodingKey {
            case id = "name"
            case role
        }
    }

    let id: Int
    let launchDate: Date?
    let crew: [Crew]
    let description: String

    var title: String { return "Apollo \(id)" }

    var formattedLaunchDate: String {
        guard let date = launchDate  else { return "N/A" }
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

enum JSONFile: String {
    case astronauts, missions
}
