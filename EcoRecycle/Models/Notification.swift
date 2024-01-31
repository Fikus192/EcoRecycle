//
//  Notification.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 25/01/2024.
//

import Foundation

struct Notification: Codable, Identifiable {
    let id: UUID
    let title: String
    let body: String
    let date: Date
}
