//
//  PlayButton.swift
//  SwiftUIDemo
//
//  Created by Prateek Sharma on 7/5/19.
//  Copyright © 2019 Prateek Sharma. All rights reserved.
//

import SwiftUI

struct PlayButton: View {
    
    @Binding var isPlaying: Bool
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}
