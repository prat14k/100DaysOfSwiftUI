//
//  WatermarkUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 23/04/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct Watermark: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text("I am awesome!!!")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

extension View {
    func watermarked() -> some View {
        modifier(Watermark())
    }
}

struct WatermarkUIView: View {
    var body: some View {
        Color.red
            .frame(width: 300, height: 300, alignment: .center)
            .watermarked()
    }
}

struct WatermarkUIView_Previews: PreviewProvider {
    static var previews: some View {
        WatermarkUIView()
    }
}
