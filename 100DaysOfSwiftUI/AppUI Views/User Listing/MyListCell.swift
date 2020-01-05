//
//  MyListCell.swift
//  SwiftUIDemo
//
//  Created by Prateek Sharma on 7/4/19.
//  Copyright © 2019 Prateek Sharma. All rights reserved.
//

import SwiftUI

struct MyListCell: View {
    let user: User
    
    var body: some View {
        NavigationLink(destination: MyUserDetail(user: user)) {
            Image("image")
                .resizable()
                .frame(width: 55, height: 45, alignment: .leading)
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(user.name)
                    .font(.headline)
                Text(user.designation)
                    .font(.subheadline)
            }
        }
    }
}
