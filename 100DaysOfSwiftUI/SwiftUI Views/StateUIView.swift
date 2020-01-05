//
//  StateUIView.swift
//  WeSplitExample
//
//  Created by Prateek on 25/12/19.
//  Copyright © 2019 Prateek. All rights reserved.
//

import SwiftUI

struct StateUIView: View {
    @State var tapCount = 0
    var body: some View {
        Button(action: {
            self.tapCount += 1
        }) {
            Text("Tap Count: \(self.tapCount)")
        }
    }
}

struct StateUIView_Previews: PreviewProvider {
    static var previews: some View {
        StateUIView()
    }
}
