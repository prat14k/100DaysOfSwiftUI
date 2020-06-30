//
//  LoopingUIView.swift
//  WeSplitExample
//
//  Created by Prateek on 25/12/19.
//  Copyright © 2019 Prateek. All rights reserved.
//

import SwiftUI

struct LoopingUIView: View {
    var body: some View {
        Form {
            ForEach(0..<100) {
                Text("Hello \($0)")
            }
        }
    }
}

struct LoopingUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoopingUIView()
    }
}
