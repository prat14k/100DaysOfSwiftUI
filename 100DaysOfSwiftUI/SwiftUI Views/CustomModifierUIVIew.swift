//
//  CustomModifierUIVIew.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 23/04/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension Text {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct CustomModifierUIVIew: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World!")
                .modifier(Title())
            Text("Hello, World!")
                .titleStyle()
        }
    }
}

struct CustomModifierUIVIew_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifierUIVIew()
    }
}
