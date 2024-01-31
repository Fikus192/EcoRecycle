//
//  NotificationManager.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 06/11/2023.
//

import NotificationCenter
import UserNotifications
import SwiftUI

@MainActor
internal class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    static let instance = NotificationManager() // Singleton
    
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var isGranted: Bool = false
    
    @Published var notifications: [Notification] = [] { // Store notifications history
        didSet {
            saveNotifications()
        }
    }
    
    @Published var currentBadgeNumber: Int
    
    private let userDefaultsKey = "savedNotifications"
    
    override init() {
        currentBadgeNumber = UserDefaults.standard.integer(forKey: "currentBadgeNumber")
        super.init()
        notificationCenter.delegate = self
        loadNotifications()
    }
    
    internal func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        currentBadgeNumber += 1
        UIApplication.shared.applicationIconBadgeNumber = currentBadgeNumber
        return [.sound, .banner]
    }
    
    internal func requestAuthorization() async throws {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        try await notificationCenter
            .requestAuthorization(options: options)
        await getCurrentSettings()
    }
    
    internal func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isGranted = (currentSettings.authorizationStatus == .authorized)
    }
    
    internal func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
    
    internal func scheduleNotification(for date: Date, title: String? = nil, body: String? = nil) {
        let content = UNMutableNotificationContent()
        
        if let title = title {
            content.title = title
        } else {
            content.title = "Zbliża się odbiór odpadów!"
        }
        
        if let body = body {
            content.body = body
        } else {
            content.body = "Sprawdź w jakich godzinach jest odbiór odpadów w twoim regionie"
        }
        
        content.sound = .default
        content.badge = 1
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Przypomnienie zostało zaplanowane pomyślnie!")
            }
        }
        
        let newNotification = Notification(id: UUID(), title: content.title, body: content.body, date: date)
        notifications.append(newNotification)
    }
    
    private func saveNotifications() {
        do {
            let data = try JSONEncoder().encode(notifications)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            print("Error saving notifications: \(error.localizedDescription)")
        }
    }
    
    private func loadNotifications() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey) {
            do {
                notifications = try JSONDecoder().decode([Notification].self, from: data)
            } catch {
                print("Error loading notifications: \(error.localizedDescription)")
            }
        }
    }
    
}
