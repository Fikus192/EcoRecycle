//
//  NotificationManager.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 06/11/2023.
//

import UserNotifications

internal class NotificationManager {
    
    static let instance = NotificationManager() // Singleton
    
    internal func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    internal func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Zbliża się odbiór odpadów!"
        content.body = "Sprawdź w jakich godzinach jest odbiór odpadów w twoim regionie"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
}
