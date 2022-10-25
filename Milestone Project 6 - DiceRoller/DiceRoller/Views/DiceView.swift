//
//  DiceView.swift
//  DiceRoller
//
//  Created by Tony Vu on 10/4/22.
//

import CoreHaptics
import SwiftUI

struct DiceView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var hapticsEngine: CHHapticEngine?
    
    let sides = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var rollingDice: [Dice] = []
    @State private var selectedAmount = 0
    @State private var selectedSides = 0
    @State private var rolledTotal = 0
    
    @State private var showingAlert = false
    
    let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    
    @State private var startRoll = false
    @State private var rollingTime = 0.0
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.white)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.white)]
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.white)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.primary)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.white)], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary.edgesIgnoringSafeArea(.all)
                VStack (spacing: 20) {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Amount of dice:")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding([.leading, .top])
                            Picker("", selection: $selectedAmount) {
                                ForEach(1...4, id: \.self) { amount in
                                    Text("\(amount)")
                                        .foregroundColor(.white)
                                }
                            }
                            .pickerStyle(.segmented)
                            .onChange(of: selectedAmount, perform: { _ in
                                start()
                            })
                            .padding()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Number of sides:")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding([.leading, .top])
                            Picker("", selection: $selectedSides) {
                                ForEach(sides, id: \.self) { side in
                                    Text("\(side)")
                                        .foregroundColor(.white)
                                }
                            }
                            .pickerStyle(.segmented)
                            .onChange(of: selectedSides, perform: { _ in
                                start()
                            })
                            .padding()
                        }
                        
                        Spacer()
                        
                        HStack {
                            ForEach(rollingDice, id: \.self) { dice in
                                RollView(dice: dice, timeRemaining: rollingTime)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 30)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 350)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .padding(.horizontal, 20)
                    
                    HStack {
                        HStack {
                            Text("Total: ")
                                .font(.title3.bold())
                                .foregroundColor(Color.white)
                            Text("\(rolledTotal)")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 100)
                        .padding()
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                        .padding(.leading)
                        
                        Spacer()
                        
                        Button("Save") {
                            save()
                        }
                        .font(.title3.bold())
                        .frame(width: 100)
                        .padding()
                        .foregroundColor(.green)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                        .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button("ROLL") {
                        isTapped()
                    }
                    .font(.title.bold())
                    .frame(width: 120, height: 120)
                    .foregroundColor(rollingTime == 0.0 ? Color.blue : Color.black)
                    .background(Color.black)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(rollingTime == 0.0 ? Color.blue : Color.black, lineWidth: 3))
                    .offset(y: -30)
                }
                .navigationTitle("Dice Roller")
            }
        }
        .onReceive(timer) { time in
            if startRoll {
                if rollingTime > 0 {
                    rollingTime -= 0.25
                    roll()
                } else {
                    playHaptics()
                    getTotal()
                }
            }
        }
    }
    
    func start() {
        rollingDice.removeAll()
          
          for _ in 0..<selectedAmount {
              rollingDice.append(Dice(number: 0))
          }
    }
    
    func getPosition(for dice: Dice) -> Int {
        return (rollingDice.firstIndex(of: dice) ?? 0) + 1
    }
    
    func isTapped() {
        startRoll = true
        rollingTime = 5.0
    }
    
    func roll() {
        guard selectedAmount != 0, selectedSides != 0 else {
            showingAlert = true
            return
        }
        
        rolledTotal = 0
        
        withAnimation {
            for i in 0..<selectedAmount {
                rollingDice[i].number = Int.random(in: 1..<(selectedSides + 1))
            }
        }
        
    }
    
    func getTotal() {
        rolledTotal = 0
        
        rollingDice.forEach { dice in
            rolledTotal += dice.number
        }
    }
    
    private func prepareHaptics() {
          guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
          
          do {
              hapticsEngine = try CHHapticEngine()
              try? hapticsEngine?.start()
          } catch {
              print("There was an error creating the engine: \(error.localizedDescription)")
          }
    }
    
    private func playHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try hapticsEngine?.makePlayer(with: pattern)
            
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    private func save() {
        guard rolledTotal != 0 else {
            return
        }
        
        let newDiceRoll = Item(context: moc)
        newDiceRoll.date = Date()
        newDiceRoll.diceCount = Int16(selectedAmount)
        newDiceRoll.result = Int16(rolledTotal)
        newDiceRoll.sides = Int16(selectedSides)
        
        if moc.hasChanges {
            do {
                try self.moc.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
