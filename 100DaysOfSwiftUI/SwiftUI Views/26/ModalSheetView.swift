//
//  ModalSheetView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 30/06/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button("Dismiss Sheet") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ModalSheetView: View {
    @State private var isSheetPresented = false
    var body: some View {
        Button("Open Sheet") {
            self.isSheetPresented.toggle()
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetView()
        }
    }
}

struct ModalSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ModalSheetView()
    }
}
