//
//  AnimationUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 27/06/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct AnimationUIView: View {
    @State var animationCount: CGFloat = 0
    var body: some View {
        Button("Tap me") {
            self.animationCount += 1
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.orange)
        .clipShape(Capsule())
        .scaleEffect(1 + (0.2 * animationCount))
        .animation(.default)
    }
}

struct AnimationUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationUIView()
    }
}
