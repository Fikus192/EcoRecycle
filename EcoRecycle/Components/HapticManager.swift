//
//  HapticManager.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 01/12/2023.
//

import Combine
import SwiftUI

public class HapticManager {
    
    static let instance = HapticManager() // Singleton
    
    public func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    public func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

public enum TabSelection {
    case schedule, quiz, map, notifications, settings
}

public class TabSelectionManager: ObservableObject {
    @Published var selectedTab: TabSelection = .schedule
}
