//
//  GeometryUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 02/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct GeometryUIView: View {
    var body: some View {
        GeometryReader { geo in
            Image("large-image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geo.size.width)
        }
    }
}

struct GeometryUIView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryUIView()
    }
}
