//
//  TableDeleteUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 09/07/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct TableDeleteUIView: View {
    @State private var numbers = [Int]()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Item \($0)")
                    }.onDelete { (indexSet) in
                        self.numbers.remove(atOffsets: indexSet)
                    }
//                    .onMove { (indexSet, index) in
//                        guard let initialIndex = indexSet.first,
//                                index > 0
//                        else { return }
//                        let element = self.numbers.remove(at: initialIndex)
//                        self.numbers.insert(element, at: index-1)
//                    }
                }
                Button("Add Item") {
                    let count = self.numbers.count
                    self.numbers.append(count + 1)
                }
            }
            .navigationBarTitle("Table Delete Op")
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct TableDeleteUIView_Previews: PreviewProvider {
    static var previews: some View {
        TableDeleteUIView()
    }
}
