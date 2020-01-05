//
//  PickerUIView.swift
//  WeSplitExample
//
//  Created by Prateek on 25/12/19.
//  Copyright © 2019 Prateek. All rights reserved.
//

import SwiftUI

struct PickerUIView: View {
    private let items = ["AirPods Pro", "16' MacBook", "Apple Watch 5"]
    @State private var selectedItem = "16' MacBook"
    var body: some View {
        Picker("Select Item", selection: $selectedItem) {
            ForEach(0..<self.items.count) {
                Text(self.items[$0])
            }
        }
    }
}

struct PickerUIView_Previews: PreviewProvider {
    static var previews: some View {
        PickerUIView()
    }
}
