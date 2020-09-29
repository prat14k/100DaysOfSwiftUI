//
//  BindingUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 22/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct PushButton: View {
    @Binding var rememberMe: Bool

    private var colors: [Color] {
        return rememberMe ? [.red, .orange] : [.green, .blue]
    }

    var body: some View {
        Button("Remember me") {
            self.rememberMe.toggle()
        }
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
        .clipShape(Capsule())
        .shadow(radius: rememberMe ? 0 : 5)
    }
}

struct BindingUIView: View {
    @State private var rememberMe = false
    var body: some View {
        VStack(spacing: 5) {
            PushButton(rememberMe: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct BindingUIView_Previews: PreviewProvider {
    static var previews: some View {
        BindingUIView()
    }
}
