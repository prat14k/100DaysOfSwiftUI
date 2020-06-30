//
//  ContentView.swift
//  WeSplitExample
//
//  Created by Prateek on 25/12/19.
//  Copyright © 2019 Prateek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section(header: Text("Header"), footer: Text("Footer")) {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            Section {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
