//
//  NavigationUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 02/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct Navigation1UIView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("Yo Yo")) {
                    Text("Hello, World!")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct Navigation2UIView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { i in
                NavigationLink(destination: Text("Yo \(i)")) {
                    Text("Hello, \(i)  World!")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct NavigationUIView_Previews: PreviewProvider {
    static var previews: some View {
        Navigation2UIView()
    }
}
