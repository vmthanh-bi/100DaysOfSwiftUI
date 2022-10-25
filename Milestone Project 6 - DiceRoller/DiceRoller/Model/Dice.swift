//
//  Dice.swift
//  DiceRoller
//
//  Created by Tony Vu on 10/4/22.
//

import Foundation

struct Dice: Hashable {
    var id = UUID()
    var number: Int
    
    static let example = Dice(number: 100)
}

struct Roll {
    var id = UUID()
    var diceSides: Int
    var diceCount: Int
    var result: Int
    
    static let example = Roll(id: UUID(), diceSides: 6, diceCount: 2, result: 100)
}
