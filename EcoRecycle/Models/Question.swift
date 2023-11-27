//
//  Question.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 27/11/2023.
//

import SwiftUI

struct Question: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case question
        case options
        case answer
    }
    
    var id: UUID = .init()
    var question: String
    var options: [String]
    var answer: String
    
    var tappedAnswer: String = ""
}
