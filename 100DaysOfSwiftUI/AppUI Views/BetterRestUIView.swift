//
//  BetterRestUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 24/04/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct BetterRestUIView: View {

    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeeCups = 1

    var body: some View {
        NavigationView {
            Form {
                VStack {
                    // Wake Up Time Components
                    Text("When do you wanna wake up?")
                    .font(.headline)
                    DatePicker(selection: $wakeUp, displayedComponents: .hourAndMinute) {
                        Text("Select time to wake up")
                    }
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                }

                VStack {
                    // Sleep amount stepper
                    Text("How much do you think you wanna sleep?")
                        .font(.headline)
                    Stepper("\(sleepAmount, specifier: "%g") hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    .frame(maxWidth: 200)
                }

                VStack {
                    // Coffee cups
                    Text("How much coffee cups you need?")
                        .font(.headline)
                    Stepper(value: $coffeeCups, in: 0...8) {
                        if coffeeCups > 1 {
                            Text("\(coffeeCups) cups")
                        } else {
                            Text("1 cup")
                        }
                    }
                    .frame(maxWidth: 180)
                }
            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing: Button(action: calculateActualSleep, label: {
                Text("Calculate")
            }))
        }
    }

    private func calculateActualSleep() {

    }
}

struct BetterRestUIView_Previews: PreviewProvider {
    static var previews: some View {
        BetterRestUIView()
    }
}
