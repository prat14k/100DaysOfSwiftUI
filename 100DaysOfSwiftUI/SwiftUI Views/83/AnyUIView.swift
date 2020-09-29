//
//  AnyUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 22/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct AnyUIView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            VStack(spacing: 5) {
                Text("Size-class")
                Text("Compact")
            }.font(.headline)
        } else {
            HStack(spacing: 5) {
                Text("Size-class")
                Text("Regular")
            }.font(.headline)
        }
    }
}

struct AnyUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnyUIView()
    }
}
