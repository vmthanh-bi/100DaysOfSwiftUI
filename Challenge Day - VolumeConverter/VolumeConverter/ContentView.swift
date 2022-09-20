//
//  ContentView.swift
//  timeConverter
//
//  Created by Tony Vu on 9/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let timeUnits = ["mliters", "liters", "cups", "pints", "gallons"]
    
    var convertedVolume: String {
        let toConvert = Double(inputValue) ?? 0
        var convertingValue: Measurement<UnitVolume>
        var outputValue: String
        
        let inputSelection = timeUnits[inputUnit]
        switch inputSelection {
        case "gallons":
            convertingValue = Measurement(value: toConvert, unit: UnitVolume.gallons)
        case "pints":
            convertingValue = Measurement(value: toConvert, unit: UnitVolume.pints)
        case "cups":
            convertingValue = Measurement(value: toConvert, unit: UnitVolume.cups)
        case "liters":
            convertingValue = Measurement(value: toConvert, unit: UnitVolume.liters)
        default:
            convertingValue = Measurement(value: toConvert, unit: UnitVolume.milliliters)
        }
        
        let outputSelection = timeUnits[outputUnit]
        switch outputSelection {
        case "gallons":
            outputValue = String(describing: convertingValue.converted(to: UnitVolume.gallons))
        case "pints":
            outputValue = String(describing: convertingValue.converted(to: UnitVolume.pints))
        case "cups":
            outputValue = String(describing: convertingValue.converted(to: UnitVolume.cups))
        case "liters":
            outputValue = String(describing: convertingValue.converted(to: UnitVolume.liters))
        default:
            outputValue = String(describing: convertingValue.converted(to: UnitVolume.milliliters))
        }
        
        return outputValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Please choose your units")) {
                    VStack(spacing: 10) {
                        Text("Select your input unit")
                            .font(.caption)
                            .padding(.top, 4)
                        Picker ("Input unit", selection: $inputUnit) {
                            ForEach(0 ..< timeUnits.count) {
                                Text("\(self.timeUnits[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom, 10)
                        
                        Divider()
                        
                        Text("Select your output unit")
                            .font(.caption)
                        Picker ("Onput unit", selection: $outputUnit) {
                            ForEach(0 ..< timeUnits.count) {
                                Text("\(self.timeUnits[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom, 10)
                    }
                }
                
                Section(header: Text("Value to convert")) {
                    TextField("Enter a value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Converted value")) {
                    Text("\(convertedVolume)")
                }
            }
            .navigationTitle("VolumeConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
