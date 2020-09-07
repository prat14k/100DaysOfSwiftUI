//
//  DrawingUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 04/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

// MARK:- Part 1

struct Drawing1UIView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }.fill(Color.red)
    }
}

// MARK:- Part 2

struct Triangle: Shape {

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minY, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Drawing2UIView: View {
    var body: some View {
        Triangle()
            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
    }
}


// MARK:- Part 3
struct Arc: InsettableShape {
    let startAngle: Double
    let endAngle: Double
    let clockwise: Bool
    var insetAmount: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let adjustmentAngle = Angle.degrees(90)
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: (rect.width / 2) - insetAmount,
                    startAngle: .degrees(startAngle) - adjustmentAngle,
                    endAngle: .degrees(endAngle) - adjustmentAngle,
                    clockwise: !clockwise)
        return path
    }

    func inset(by amount: CGFloat) -> Arc {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Drawing3UIView: View {
    var body: some View {
        Arc(startAngle: 0, endAngle: 360, clockwise: true)
            .strokeBorder(Color.blue, lineWidth: 20)
    }
}


struct DrawingUIView_Previews: PreviewProvider {
    static var previews: some View {
        Drawing3UIView()
    }
}
