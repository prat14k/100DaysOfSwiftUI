//
//  MyUserDetail.swift
//  SwiftUIDemo
//
//  Created by Prateek Sharma on 7/4/19.
//  Copyright © 2019 Prateek Sharma. All rights reserved.
//

import SwiftUI

struct MyUserDetail: View {
    let user: User
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: Alignment.topLeading) {
            Color.black.opacity(0.7)
            
            Image("image")
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(user.name), displayMode: .inline)
                .onTapGesture {
                    withAnimation { self.zoomed.toggle() }
                }
                // Flexible View
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            if !zoomed {
                Image(systemName: "video.fill")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.all)
                    .transition(.move(edge: .leading))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
