//
//  CapsuleButtonUIExample.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 14/04/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct CapsuleText: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .clipShape(Capsule())
    }
}

struct CapsuleButtonUIExample: View {
    var body: some View {
        VStack {
            CapsuleText(text: "alsnd")
            CapsuleText(text: "wewewe ewex")
        }
    }
}

struct CapsuleButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButtonUIExample()
    }
}
