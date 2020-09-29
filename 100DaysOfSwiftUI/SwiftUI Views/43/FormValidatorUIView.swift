//
//  FormValidatorUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 21/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct FormValidatorUIView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    private var isFormIncomplete: Bool {
        return email.isEmpty || password.isEmpty
    }

    var body: some View {
        Form {
            TextField("Enter Email", text: $email)
            TextField("Enter Password", text: $password)
            Section {
                Button("Create Account") {
                    // create Account
                }
            }.disabled(isFormIncomplete)
        }
    }
}

struct FormValidatorUIView_Previews: PreviewProvider {
    static var previews: some View {
        FormValidatorUIView()
    }
}
