//
//  WordScrambleUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 14/05/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct WordScrambleUIView: View {
    @State private var newWord = ""
    @State var words = [String]()
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                List(words, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
        }.onAppear(perform: onAppear)
    }

    private func onAppear() {
        print("Appear")
    }

    private func addNewWord() {
        let newWord = self.newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard !newWord.isEmpty  else { return }
        words.insert(newWord, at: 0)
        self.newWord = ""
    }
}

struct WordScrambleUIView_Previews: PreviewProvider {
    static var previews: some View {
        WordScrambleUIView()
    }
}
