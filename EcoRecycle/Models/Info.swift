//
//  Info.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 27/11/2023.
//

import SwiftUI

struct Info: Codable {
    enum CodingKeys: CodingKey {
        case title
        case subtitle
    }
    
    var title: String
    var subtitle: String
}
