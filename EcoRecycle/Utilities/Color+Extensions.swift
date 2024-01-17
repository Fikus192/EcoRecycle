//
//  Color+Extensions.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 04/01/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("CustomGreenColor")
    let red = Color("CustomRedColor")
    let secondaryText = Color("SecondaryTextColor")
    
}
