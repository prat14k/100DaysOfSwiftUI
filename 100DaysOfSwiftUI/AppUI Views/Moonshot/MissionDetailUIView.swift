//
//  MissionDetailUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 04/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

private struct CrewMember: Codable, Identifiable {
    let astronaut: Astronaut
    let role: String
    var id: String { astronaut.id }
}

struct MissionDetailUIView: View {
    private let mission: Mission
    private let crewMembers: [CrewMember]

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    Image("apollo\(self.mission.id)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.7)
                        .padding(.top, 35)
                    Text(self.mission.description)
                        .padding()
                        .layoutPriority(1)
                    if !self.crewMembers.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Crew Members:")
                                .font(.headline)
                                .padding(.leading)
                            ForEach(self.crewMembers) { member in
                                NavigationLink(destination: AstronautUIView(astronaut: member.astronaut)) {
                                    CrewMemberListUICell(astronaut: member.astronaut, role: member.role)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.horizontal)
                            }
                        }
                    }
                    Spacer(minLength: 30)
                }
            }
            .navigationBarTitle(Text(self.mission.title), displayMode: .inline)
        }
    }

    init(mission: Mission) {
        self.mission = mission
        let astronauts = (try? [Astronaut](fromJSON: .astronauts)) ?? []
        var members = [CrewMember]()
        for person in mission.crew {
            guard let astronaut = astronauts.first(where: { $0.id == person.id })
            else { continue }
            members.append(CrewMember(astronaut: astronaut, role: person.role))
        }
        crewMembers = members
    }
}

struct MissionDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailUIView(mission: (try! [Mission](fromJSON: .missions))[0])
    }
}
