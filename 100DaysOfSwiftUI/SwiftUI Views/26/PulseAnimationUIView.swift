//
//  PulseAnimationUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 27/06/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct PulseAnimationUIView: View {
    @State var animationAmount: Double = 1

    var body: some View {
        Button("Tap Me") { }
            .foregroundColor(.white)
            .padding()
            .frame(width: 100, height: 100)
            .background(Color.orange)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.orange)
                    .scaleEffect(CGFloat(animationAmount))
                    .opacity(2 - animationAmount)
                    .animation(
                        Animation.easeIn(duration: 2)
                                 .repeatForever(autoreverses: false)
                    )
            )
            .onAppear {
                self.animationAmount = 2
            }
    }
}

struct PulseAnimationUIView_Previews: PreviewProvider {
    static var previews: some View {
        PulseAnimationUIView()
    }
}
