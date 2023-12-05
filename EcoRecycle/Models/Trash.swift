//
//  Trash.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 01/12/2023.
//

import SwiftUI

struct Trash: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case category
    }
    
    var id: UUID = .init()
    var name: String
    var category: String
    
    var color: Color {
        switch category {
        case "Metale i tworzywa sztuczne":
            return .yellow
        case "Papier":
            return .blue
        case "Szkło":
            return .green
        case "Biodegradowalne":
            return .brown
        case "Zmieszane":
            return .black
        case "PSZOK":
            return .red
        default:
            return .gray
        }
    }
}
