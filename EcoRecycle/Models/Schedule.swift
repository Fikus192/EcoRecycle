//
//  Schedule.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 14/12/2023.
//

import SwiftUI

struct Schedule: Codable, Identifiable {
    enum WasteType: String, CaseIterable {
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
        
        func dates(for wasteType: WasteType) -> [String] {
            switch wasteType {
            case .tworzywaSztuczne:
                return tworzywaSztuczne
            case .szklo:
                return szklo
            case .papier:
                return papier
            case .biodegradowalne:
                return biodegradowalne
            case .zmieszane:
                return zmieszane
            case .popiol:
                return popiol
            }
        }
        
        func convertIntoPolish(for wasteType: WasteType) -> String {
            switch wasteType {
            case .tworzywaSztuczne:
                return "Metale i tworzywa sztuczne"
            case .szklo:
                return "Szkło"
            case .papier:
                return "Papier"
            case .biodegradowalne:
                return "Biodegradowalne"
            case .zmieszane:
                return "Zmieszane"
            case .popiol:
                return "Popiół"
            }
        }
        
        var allWasteTypes: [WasteType] {
            return WasteType.allCases
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
