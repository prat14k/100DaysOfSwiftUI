//
//  TextFieldUIView.swift
//  WeSplitExample
//
//  Created by Prateek on 25/12/19.
//  Copyright © 2019 Prateek. All rights reserved.
//

import SwiftUI

struct TextFieldUIView: View {
    @State private var name = ""

    private var trimmedName: String {
        return name.trimmingCharacters(in: .whitespaces)
    }

    var body: some View {
        Form {
            TextField("Enter name", text: $name)
            if !trimmedName.isEmpty {
                Text("Your name is \(trimmedName)")
            }
        }
    }
}

struct TextFieldUIView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldUIView()
    }
}
