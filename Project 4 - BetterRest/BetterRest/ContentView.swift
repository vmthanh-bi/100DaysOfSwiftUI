//
//  ContentView.swift
//  BetterRest
//
//  Created by Tony Vu on 9/30/21.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recommended bedtime").font(.headline)) {
                        Text("\(calculateBedtime())")
                            .font(.largeTitle)
                }
                
                Section(header: Text("When would you like to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section(header: Text("Desired amount of sleep")) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake")) {
//                    Stepper(value: $coffeeAmount, in: 4...20) {
//                        if coffeeAmount == 1 {
//                            Text("1 cup")
//                        } else {
//                            Text("\(coffeeAmount) cups")
//                        }
//                    }
                    Picker ("Number of cups", selection: $coffeeAmount) {
                        ForEach(0..<21) { number in
                            Text("\(number)")
                        }
                    }
                }
                
            }
            .navigationTitle("BetterRest")
//            .navigationBarItems(trailing:
//                Button(action: calculateBedtime) {
//                    Text("Calculate")
//                }
//            )
//            .alert(isPresented: $showingAlert) {
//                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//            }
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() -> String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        let recommendationMsg: String
        
        do {
            let prediction = try
            model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            recommendationMsg = formatter.string(from: sleepTime)
//            alertTitle = "Your ideal bedtime is ..."
        } catch {
//            alertTitle = "Error"
            recommendationMsg = "Sorry, there was a problem calculating your bedtime."
        }
        
        return recommendationMsg
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
