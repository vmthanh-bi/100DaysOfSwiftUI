//
//  ContentView.swift
//  brainTrain
//
//  Created by Tony Vu on 10/5/21.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    @State private var appChoice = Int.random(in: 0...2)
    @State private var outcome = Bool.random()
    
    @State private var score = 0
    @State private var round = 0
    
    @State private var message = ""
    @State private var showAlert = false

    
    var determineOutcome: String {
        outcome ? "win" : "lose"
    }
    
    var body: some View {
        ZStack {
            VStack (spacing: 20){
                Spacer()
                
                Text("Round \(round)/10")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(width: 200, height: 50)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack (spacing: 0) {
                    Text("The computer picked ")
                    Text("\(moves[appChoice].lowercased())")
                        .fontWeight(.heavy)
                    Text(".")
                }
                
                HStack (spacing: 0) {
                    Text("To ")
                    Text("\(determineOutcome)")
                        .fontWeight(.heavy)
                    Text(", what will you choose?")
                }
                
                ForEach(0..<moves.count) { number in
                    Button(action: {
                        self.choiceTapped(number)
                    }) {
                        Text(self.moves[number])
                            .fontWeight(.semibold)
                    }
                }
                .frame(width: 100, height: 30)
                .background(Color.gray)
                .foregroundColor(Color.white)
                .clipShape(Capsule())
                .overlay(Capsule()
                            .stroke(Color("Outline Color"), lineWidth: 3))
                
                Spacer()
                
                Text("Your current score is \(score).")
                    .padding(.bottom)
            }
        }
        .frame(width: 300, height: 500)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
        .alert(isPresented: $showAlert){
                    Alert(title: Text("\(message)"),
                    message: round < 10 ? Text("Rounds remaining: \(9 - round).") :
                    Text("You played 10 rounds.").font(.largeTitle), dismissButton:
                    .default(Text(round < 10 ? "Continue": "Restart")){
                        self.restart()
                        })
        }
    }
    
    func choiceTapped(_ myChoice: Int) {
        if outcome {
            if myChoice == 0 && appChoice == 2 {
                self.score += 1
                message = "Correct"
            } else if myChoice == appChoice + 1 {
                self.score += 1
                message = "Correct"
            } else {
                self.score -= 1
                message = "Wrong"
            }
        } else {
            if myChoice == 2 && appChoice == 0 {
                self.score += 1
                message = "Correct"
            } else if myChoice == appChoice - 1 {
                self.score += 1
                message = "Correct"
            } else {
                self.score -= 1
                message = "Wrong"
            }
        }
        
        showAlert = true
    }
    
    func restart() {
        appChoice = Int.random(in: 0...2)
        outcome = Bool.random()
        score = 0
        round = round < 10 ? round + 1 : round - 10
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
