//
//  PractiseUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 16/02/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct Practise1UIView: View {
    var body: some View {
        Text("Hello, World!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Practise2UIView: View {
    var body: some View {
        ZStack {
            Color.red
            Text("Hello, World!")
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Practise3UIView: View {
    var body: some View {
        Text("Hello, World!")
            .background(Color.red)
            .padding()
            .background(Color.blue)
            .padding()
            .background(Color.purple)
    }
}

struct Practise4UIView: View {
    var body: some View {
        Button(action: {
            print(type(of: self.body))
        }) {
            Text("asd")
        }
    }
}

struct Practise5UIView: View {
    var body: some View {
        VStack {
            Text("GRdasmdlk als")
            Text("GRdasmdlk als")
                .font(.largeTitle)
            Text("GRdasmdlk als")
            Text("GRdasmdlk als")
        }
        .font(.title)
    }
}

struct Practise6UIView: View {
    let txt1 = Text("GRdasmdlk als")
    let txt2 = Text("GRdasmdlk als")

    var body: some View {
        VStack {
            txt1
            txt2.font(.title)
        }
    }
}

struct PractiseUIView_Previews: PreviewProvider {
    static var previews: some View {
        Practise6UIView()
    }
}
