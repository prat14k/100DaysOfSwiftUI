//
//  CrewMemberListUICell.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 04/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct CrewMemberListUICell: View {
    let astronaut: Astronaut
    let role: String

    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(astronaut.id)
                .resizable()
                .scaledToFit()
                .frame(width: 85, height: 60)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
            VStack(alignment: .leading, spacing: 7) {
                Text(astronaut.name)
                    .font(.headline)
                Text(role)
                    .foregroundColor(.secondary)
            }
            .padding([.top, .bottom])
            Spacer()
        }
    }
}

struct CrewMemberListUICell_Previews: PreviewProvider {
    static var previews: some View {
        CrewMemberListUICell(astronaut: (try! [Astronaut](fromJSON: .astronauts))[0],
                             role: "Pilot")
    }
}
