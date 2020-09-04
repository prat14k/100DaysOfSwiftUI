//
//  MoonTripUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 03/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct MoonTripUIView: View {
    private let missions = (try? [Mission](fromJSON: .missions)) ?? []

    var body: some View {
        NavigationView {
            List(missions) { item in
                NavigationLink(destination: MissionDetailUIView(mission: item)) {
                    HStack(alignment: .center, spacing: 15) {
                        Image("apollo\(item.id)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Apollo \(item.id)")
                                .font(.headline)
                            Text(item.formattedLaunchDate)
                                .font(.subheadline)
                        }
                        .padding([.top, .bottom], 7)
                    }
                }
            }
        .navigationBarTitle("US MoonTrips")
        }
    }
}

struct MoonTrip_Previews: PreviewProvider {
    static var previews: some View {
        MoonTripUIView()
    }
}
