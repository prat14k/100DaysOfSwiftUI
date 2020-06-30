//
//  StepperUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 24/04/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct StepperUIView: View {
    @State private var value = 10.0

    var body: some View {
        Stepper("Step Value \(value, specifier: "%g")",
            value: $value, in: 0...20, step: 0.25)
    }
}

struct StepperUIView_Previews: PreviewProvider {
    static var previews: some View {
        StepperUIView()
    }
}
