//
//  RollView.swift
//  DiceRoller
//
//  Created by Tony Vu on 10/4/22.
//

import SwiftUI

struct RollView: View {
    let dice: Dice
    let timeRemaining: Double
    let backgroundColors: [Color] = [.blue, .pink, .purple]
    var body: some View {
        VStack {
            Text("\(dice.number)")
                .font(dice.number == 100 ? .title2 : .title)
                .fontWeight(.heavy)
                .foregroundColor(timeRemaining == 0.0 ? Color.primary : Color.white)
                .frame(width: 45, height: 45)
            .padding(10)
        }
        .background(timeRemaining == 0.0 ? Color.white : backgroundColors.randomElement())
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
    }
}

struct RollView_Previews: PreviewProvider {
    static var previews: some View {
        RollView(dice: Dice.example, timeRemaining: 0.1)
    }
}
