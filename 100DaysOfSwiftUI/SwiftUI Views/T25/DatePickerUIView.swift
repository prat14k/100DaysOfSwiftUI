//
//  DatePickerUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 24/04/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct DatePickerUIView: View {
    @State private var date = Date()

    var body: some View {
        DatePicker(selection: $date, in: Date()..., displayedComponents: .date) {
            Text("DatePicker")
        }
        .labelsHidden()
    }
}

struct FormDatePickerUIView: View {
    @State private var date = Date()

    var body: some View {
        Form {
            DatePicker(selection: $date, in: Date()..., displayedComponents: .date) {
                Text("DatePicker")
            }
        }
    }
}

struct DatePickerUIView_Previews: PreviewProvider {
    static var previews: some View {
        FormDatePickerUIView()
    }
}
