//
//  AppUIView.swift
//  WeSplitExample
//
//  Created by Prateek on 01/01/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct AppUIView: View {
    @State private var checkAmount = ""
    @State private var numOfPeople = 2
    @State private var tipPercentage = 2
    private let tipsOptions = [10, 15, 20, 25, 30]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    Picker("Number of People", selection: $numOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipsOptions.count) {
                            Text("\(self.tipsOptions[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    if checkValue > 0 {
                        Text("Your check Amount is: $\(totalPerPerson, specifier: "%.2f")")
                    } else {
                        Text("There is no amount to be paid")
                    }
                }
            }
            .navigationBarTitle("WeSplit", displayMode: .inline)
        }
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numOfPeople + 2)
        let tipSelection = Double(tipsOptions[tipPercentage])
        let orderAmount = checkValue

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

    var checkValue: Double {
        return Double(checkAmount.trimmingCharacters(in: .whitespaces)) ?? 0
    }
}

struct AppUIView_Previews: PreviewProvider {
    static var previews: some View {
        AppUIView()
    }
}
