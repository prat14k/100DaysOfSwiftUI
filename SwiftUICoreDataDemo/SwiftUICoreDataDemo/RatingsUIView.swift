//
//  RatingsUIView.swift
//  SwiftUICoreDataDemo
//
//  Created by Prateek on 29/09/20.
//

import SwiftUI

struct RatingsUIView: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow


    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
                Spacer()
            }

            ForEach(1..<(maximumRating + 1)) { number in
                image(for: number)
                    .foregroundColor(color(for: number))
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }

    func color(for number: Int) -> Color {
        if number > rating {
            return offColor
        } else {
            return onColor
        }
    }

    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingsUIView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsUIView(rating: .constant(3))
            .previewLayout(.sizeThatFits)
    }
}
