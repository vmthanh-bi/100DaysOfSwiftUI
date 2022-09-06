//
//  Card.swift
//  Flashzilla
//
//  Created by Tony Vu on 4/12/22.
//

import Foundation

struct Card: Codable, Identifiable {
    var id: UUID
    let prompt: String
    let answer: String

    static let example = Card(id: UUID(), prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
