//
//  ListUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 24/04/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct ListUIView: View {
    let items = ["Anakin", "Luke", "Leia", "Palpatine", "Chewie", "Han"]

    var body: some View {
        List {
            ForEach(items, id: \.self) {
                Text($0)
            }
            Text("Mandalorian")
            Text("Yoda")
        }
    }
}

struct ListUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListUIView()
    }
}
