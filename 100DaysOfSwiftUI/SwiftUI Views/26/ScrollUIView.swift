//
//  ScrollUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 02/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct ScrollUIView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(1..<50) {
                    Text("Title \($0)")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ScrollUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollUIView()
    }
}
