//
//  FlowerUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 06/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct Flower: Shape {
//    private var colors: [UIColor] = [
//        .orange, .blue, .cyan, .green, .systemTeal, .magenta, .systemIndigo, .yellow
//    ]

    let centerOffset: CGFloat
    let petalWidth: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            var transform = CGAffineTransform(rotationAngle: number)
            transform = transform.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            let ellipsePath = Path(ellipseIn: CGRect(x: centerOffset, y: 0, width: petalWidth, height: rect.width / 2))
            path.addPath(ellipsePath.applying(transform))
        }
        return path
    }
}

struct FlowerUIView: View {

    @State private var petalCenterOffset: CGFloat = -20
    @State private var petalWidth: CGFloat = 100.0
    var body: some View {
        VStack {
            Flower(centerOffset: petalCenterOffset, petalWidth: petalWidth)
                .fill(Color.blue, style: FillStyle(eoFill: true, antialiased: false))
//                .stroke(Color.green, lineWidth: 5)
            Text("Flower Center Spacing")
                .font(.headline)
            Slider(value: $petalCenterOffset, in: -40...40)

            Text("Petal Width")
                .font(.headline)
            Slider(value: $petalWidth, in: 10...100)
        }.padding()
    }
}

struct FlowerUIView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerUIView()
    }
}
