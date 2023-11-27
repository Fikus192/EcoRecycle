//
//  Text+Extensions.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 27/11/2023.
//

import Foundation
import SwiftUI

extension Text {
    public func customTitle() -> some View {
        self
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(.accent)
    }
}
