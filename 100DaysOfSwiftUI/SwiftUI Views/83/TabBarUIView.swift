//
//  TabBarUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 29/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct TabBarUIView: View {
    private enum Tabs: String {
        case tab1, tab2
    }

    @State private var currentTab = Tabs.tab1.rawValue

    var body: some View {
        TabView(selection: $currentTab) {
            VStack {
                Text("Tab 1")
                Button("Switch tab") {
                    currentTab = Tabs.tab2.rawValue
                }
            }.tabItem {
                Image(systemName: "star")
                Text("T1")
            }
            .tag(Tabs.tab1.rawValue)

            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("T2")
                }
                .tag(Tabs.tab2.rawValue)
        }
    }
}

struct TabBarUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIView()
    }
}
