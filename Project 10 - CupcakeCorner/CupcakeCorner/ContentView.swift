//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Tony Vu on 11/3/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.info.type) {
                        ForEach(0..<OrderInfo.types.count) {    // add id: \.self if text appears in controller
                            Text(OrderInfo.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.info.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.info.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.info.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if order.info.specialRequestEnabled {
                        Toggle(isOn: $order.info.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $order.info.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details ")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
