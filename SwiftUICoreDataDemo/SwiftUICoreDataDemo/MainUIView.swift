//
//  MainUIView.swift
//  SwiftUICoreDataDemo
//
//  Created by Prateek on 29/09/20.
//

import SwiftUI

struct MainUIView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var isShowingSheet = false
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>

    var body: some View {
//        NavigationView {
//            List(books, id: \.id) {
//                Text("\($0.id ?? UUID())")
//            }
            Text("\(books.count)")
                .navigationBarTitle("Bookworm")
                .navigationBarItems(trailing: Button {
                    isShowingSheet = true
                } label: {
                    Image(systemName: "plus")
                }.frame(width: 45, height: 45))
                .sheet(isPresented: $isShowingSheet, content: {
                    AddBookView()
                        .environment(\.managedObjectContext, moc)
                })
//        }
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
