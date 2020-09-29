//
//  CupCakeFormUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 21/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct CupCakeFormUIView: View {

    @ObservedObject private var order = Order()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select Flavour", selection: $order.flavour) {
                        ForEach(Flavour.allCases.map({ $0.rawValue }), id: \.self) {
                            Text($0.capitalized)
                        }
                    }
                    Stepper(value: $order.numberOfCakes, in: 1...20) {
                        Text("Number of Cakes: \(self.order.numberOfCakes)")
                    }
                }
                Section {
                    Toggle(isOn: $order.hasSpecialRequests.animation()) {
                        Text("Any special requests?")
                    }
                    if order.hasSpecialRequests {
                        Toggle(isOn: $order.isExtraFrostingRequested) {
                            Text("Add extra frosting")
                        }
                        Toggle(isOn: $order.isExtraSprinklesRequested) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                Section {
                    NavigationLink(destination: AddressUIView(order: self.order)) {
                        Text("View order")
                    }
                }
            }
            .navigationBarTitle("CupCake")
        }
    }
}

struct CupCakeFormUIView_Previews: PreviewProvider {
    static var previews: some View {
        CupCakeFormUIView()
    }
}
