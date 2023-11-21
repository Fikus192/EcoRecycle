//
//  Location.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 13/11/2023.
//

import Foundation

struct Location: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id, name, address, zipcode, city
        case opening_hours, opening_hours_weekend
        case phone, mail, latitude, longitude
    }
    
    let id: Int
    let name: String
    let address: String
    let zipcode: String
    let city: String
    let opening_hours: String
    let opening_hours_weekend: String
    let phone: String
    let mail: String
    let latitude: Double
    let longitude: Double
    
    static let allLocations: [Location] = Bundle.main.decode([Location].self, from: "PSZOK_Locations.json")
    static let sampleLocation: Location = allLocations[0]

    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
