//
//  PlayerView.swift
//  SwiftUIDemo
//
//  Created by Prateek Sharma on 7/5/19.
//  Copyright © 2019 Prateek Sharma. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    @State private var isPlaying = false
    
    var body: some View {
        ZStack {
            Color(red: 249 / 255, green: 176 / 255, blue: 66 / 255)
            
            VStack(spacing: 15) {
                VStack(spacing: 0) {
                    Text("Friction")
                        .font(.headline)
                    Text("Missiion Impossible")
                        .font(.subheadline)
                }
                PlayButton(isPlaying: $isPlaying)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
