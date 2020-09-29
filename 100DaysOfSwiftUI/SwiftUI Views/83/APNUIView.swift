//
//  APNUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 29/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI
import UserNotifications

struct APNUIView: View {
    var body: some View {
        Button("Request") {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                guard granted  else { return }
//                UNUserNotificationCenter.regi
            }
        }

        Button("Schedule") {
            let content = UNMutableNotificationContent()
            content.title = "APN"
            content.subtitle = "SwiftUI"
            content.body = "SwiftUI rocks"
            content.sound = .default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}

struct APNUIView_Previews: PreviewProvider {
    static var previews: some View {
        APNUIView()
    }
}
