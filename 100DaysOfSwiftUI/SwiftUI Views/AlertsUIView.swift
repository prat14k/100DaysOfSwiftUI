//
//  AlertsUIView.swift
//  WeSplitExample
//
//  Created by Prateek on 05/01/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct AlertsUIView: View {
    @State private var isShowingAlert = false
    var body: some View {
        Button(action: {
            self.isShowingAlert = true
        }) {
            HStack(spacing: 8) {
                Image(systemName: "pencil")
                Text("Like")
            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Alert"), message: Text("This is a SwiftUI Alert"), dismissButton: .default(Text("OK")))
        }
    }
}

struct AlertsUIView_Previews: PreviewProvider {
    static var previews: some View {
        AlertsUIView()
    }
}
