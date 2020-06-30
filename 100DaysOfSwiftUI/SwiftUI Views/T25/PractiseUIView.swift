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

struct Practise7UIView: View {
    var body: some View {
        Text("Call to action")
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Practise8UIView: View {
    var body: some View {
        MyContainerView {
            Text("I ❤️ SwiftUI")
        }
    }
}

struct MyContainerView<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            HStack {
                Spacer()
                VStack {
                    Text("DemoApp")
                        .foregroundColor(.purple)
                        .font(.system(size: 15, weight: .bold))
                        .padding(.trailing, 15)
                    Spacer()
                }
            }
            content
        }
    }
}

struct PractiseUIView_Previews: PreviewProvider {
    static var previews: some View {
        Practise8UIView()
    }
}
