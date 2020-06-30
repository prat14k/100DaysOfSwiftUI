//
//  CustomContainer.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 23/04/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct GridView<Content: View>: View {
    let row: Int
    let column: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<row) { i in
                HStack {
                    ForEach(0..<self.column) { j in
                        self.content(i, j)
                    }
                }
            }
        }
    }

    init(row: Int, column: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.row = row
        self.column = column
        self.content = content
    }
}

struct CustomContainer: View {
    var body: some View {
        GridView(row: 3, column: 3) { (i, j) in
            Image(systemName: "\((i * 3) + (j + 1)).circle")
            Text("\(i)|\(j)")
        }
    }
}

struct CustomContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainer()
    }
}
