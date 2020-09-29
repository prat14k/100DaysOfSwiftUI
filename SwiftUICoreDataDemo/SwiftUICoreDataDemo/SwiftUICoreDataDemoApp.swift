//
//  SwiftUICoreDataDemoApp.swift
//  SwiftUICoreDataDemo
//
//  Created by Prateek on 29/09/20.
//

import SwiftUI

@main
struct SwiftUICoreDataDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainUIView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
