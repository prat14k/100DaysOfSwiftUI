//
//  AddressUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 21/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct AddressUIView: View {
    @ObservedObject var order = Order()
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            Section {
                NavigationLink(destination: CheckoutUIView()) {
                    Text("Checkout")
                }
            }.disabled(!order.canGoToCheckout)
        }
        .navigationBarTitle("Delivery Details")
    }
}

struct AddressUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddressUIView()
    }
}
