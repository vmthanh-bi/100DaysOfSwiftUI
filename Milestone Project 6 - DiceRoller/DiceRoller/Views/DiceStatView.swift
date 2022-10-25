//
//  DiceStatView.swift
//  DiceRoller
//
//  Created by Tony Vu on 10/24/22.
//

import SwiftUI

struct DiceStatView: View {
    let rollStats: Item
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Text("Total")
                        .font(.title3)
                        .padding(.horizontal)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.black, lineWidth: 2)
                        )
                    
                    Spacer()
                    
                    Text("\(rollStats.result)")
                        .font(.system(size: 56, weight: .semibold, design: .rounded))
                }
                .padding()
                .padding(.vertical)
                .offset(y: 5)
                .frame(width: 140, height: 140)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(rollStats.diceCount)")
                            .fontWeight(.bold)
                        if rollStats.diceCount == 1 {
                            Text("Die")
                        } else {
                            Text("Dice")
                        }
                    }

                    Spacer()
                    
                    HStack {
                        Text("\(rollStats.sides)")
                            .fontWeight(.bold)
                        Text("Sides")
                    }
                }
                .font(.title)
                .padding(.vertical, 25)
                .padding(.horizontal, 8)
                .foregroundColor(Color.white)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 140)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 2)
            )
        }
    }
}

//struct DiceStatView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiceStatView()
//    }
//}
