//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Tony Vu on 11/3/21.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.info.name)
                TextField("Street Address", text: $order.info.streetAddress)
                TextField("City", text: $order.info.city)
                TextField("Zip", text: $order.info.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Checkout")
                }
                .disabled(order.info.hasValidAddress == false)
            }
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
