//
//  GuessTheFlagUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 07/01/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct GuessTheFlagUIView: View {

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0..<3)
    @State private var score = 0
    @State private var chosenAnswer: Int?
    @State private var isShowingAlert = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 40) {

                VStack(spacing: 10) {
                    Text("Guess the Flag!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .underline()
                    HStack {
                        Text("Flag:")
                        .foregroundColor(.white)
                        .font(.title)
                        Text(self.countries[self.correctAnswer])
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    }
                }

                ForEach(0..<3) { number in
                    Button(action: {
                        self.chosenAnswer = number
                        self.score += (self.chosenAnswer == self.correctAnswer) ? 1 : -1
                        self.isShowingAlert = true
                        print("Button Tapped: \(number)")
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }

                Spacer()
            }
            .padding()
        }
        .alert(isPresented: $isShowingAlert) { () -> Alert in
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Okay"), action: {
                self.resetGame()
            }))
        }
    }

    private func resetGame() {
        self.countries.shuffle()
        self.correctAnswer = Int.random(in: 0..<3)
        self.chosenAnswer = nil
    }

    private var alertTitle: String {
        return chosenAnswer == correctAnswer ? "Correct" : "Wrong Answer"
    }

    private var alertMessage: String {
        if chosenAnswer == correctAnswer {
            return "Your current score: \(score)"
        } else {
            var str = ""
            if let selection = chosenAnswer {
                str = "You have selected: \(countries[selection]).\n"
            }
            return str + "This brings your score to: \(score)."
        }
    }
}

#if DEBUG
struct GuessTheFlagUIView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlagUIView()
    }
}
#endif
