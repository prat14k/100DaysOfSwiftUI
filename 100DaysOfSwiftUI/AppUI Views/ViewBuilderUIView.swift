//
//  ViewBuilderUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 11/06/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct BaseView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            HStack {
               Image("Spain")
             }.padding(.top, 60)
             Spacer()
             Text("iOS App Templates")
             content
        }
    }
}

struct ViewBuilderUIView: View {
    var body: some View {
        BaseView {
            Text("Hello, World!")
            Text("Hello, World!")
        }
    }
}

struct ViewBuilderUIView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderUIView()
    }
}
