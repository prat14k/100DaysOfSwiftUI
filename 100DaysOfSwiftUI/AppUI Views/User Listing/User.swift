//
//  User.swift
//  SwiftUIDemo
//
//  Created by Prateek Sharma on 7/4/19.
//  Copyright © 2019 Prateek Sharma. All rights reserved.
//

import SwiftUI
import Combine

struct User: Identifiable {
    let name: String
    let designation: String
    let id = UUID()
    
    static let all: [User] = {
        return (0..<5).map { return User(name: "User \($0) Name", designation: "User \($0) Designation") }
    }()
}

class Registry {
    
    var users: [User] {
        didSet {
            didChange.send()
        }
    }
    
    init(users: [User]) {
        self.users = users
    }
    
    var didChange = PassthroughSubject<Void, Never>()
    
}
