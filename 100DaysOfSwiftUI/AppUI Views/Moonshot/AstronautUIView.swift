//
//  AstronautUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 04/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct AstronautUIView: View {
    let astronaut: Astronaut

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                        .padding(.bottom, 10)
//                    Text(astronaut.name)
//                        .font(.largeTitle)
//                        .padding(.horizontal)
                    Text(self.astronaut.description)
                        .padding()
                    Spacer(minLength: 25)
                }
            }
            .navigationBarTitle(Text(self.astronaut.name), displayMode: .inline)
        }
    }
}

struct AstronautUIView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautUIView(astronaut: (try! [Astronaut](fromJSON: .astronauts))[0])
    }
}
