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
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
