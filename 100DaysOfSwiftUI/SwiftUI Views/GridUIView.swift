//
//  GridUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 29/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//


import SwiftUI

@available(iOS 14, *)
struct GridUIView: View {

    let layout = [GridItem(.adaptive(minimum: 100))]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

@available(iOS 14, *)
struct GridUIView_Previews: PreviewProvider {
    static var previews: some View {
        GridUIView()
    }
}
