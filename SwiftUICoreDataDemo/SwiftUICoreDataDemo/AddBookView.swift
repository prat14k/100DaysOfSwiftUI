//
//  AddBookView.swift
//  SwiftUICoreDataDemo
//
//  Created by Prateek on 29/09/20.
//

import SwiftUI

enum Genre: String, CaseIterable {
    case kids
    case romance
    case poetry
    case thriller
    case mystery
    case horror
    case fantasy
}

struct AddBookView: View {

    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @State private var title = ""
    @State private var author = ""
    @State private var ratings = 3
    @State private var genre = ""
    @State private var review = ""

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of the Book", text: $title)
                    TextField("Author", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(Genre.allCases.map({ $0.rawValue.capitalized }), id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section {
                    RatingsUIView(rating: $ratings)
                    TextField("Review", text: $review)
                }

                Section {
                    Button("Save Book") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.rating = Int16(ratings)
                        newBook.review = review
                        try? moc.save()

                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
