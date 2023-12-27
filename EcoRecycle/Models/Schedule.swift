//
//  Schedule.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 14/12/2023.
//

import SwiftUI

struct Schedule: Codable, Identifiable {
    enum WasteType {
        case tworzywaSztuczne
        case szklo
        case papier
        case biodegradowalne
        case zmieszane
        case popiol
    }
    
    struct SchedulePickup: Codable {
        let tworzywaSztuczne: [String]
        let szklo: [String]
        let papier: [String]
        let biodegradowalne: [String]
        let zmieszane: [String]
        let popiol: [String]
        
        func color(forWasteType wasteType: WasteType) -> Color {
            switch wasteType {
            case .tworzywaSztuczne:
                return .yellow
            case .szklo:
                return .green
            case .papier:
                return .blue
            case .biodegradowalne:
                return .brown
            case .zmieszane:
                return .black
            case .popiol:
                return .gray
            }
        }
        
    }
    
    let id: Int
    let city: String
    let street: String
    let pickup: SchedulePickup
    
    static let allSchedules: [Schedule] = Bundle.main.decode([Schedule].self, from: "ScheduleData.json")
    static let sampleSchedule: Schedule = allSchedules[0]
    
    static func == (lhs: Schedule, rhs: Schedule) -> Bool {
        lhs.id == rhs.id
    }
}
