//
//  EcoRecycleApp.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import Firebase
import SwiftUI

@main
struct EcoRecycleApp: App {
    // -> Initializing Firebase
    init() {
        FirebaseApp.configure()
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    UIApplication.shared.applicationIconBadgeNumber = 0
                }
        }
    }
}
