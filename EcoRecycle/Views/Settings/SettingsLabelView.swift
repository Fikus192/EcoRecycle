//
//  SettingsLabelView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 21/09/2023.
//

import SwiftUI

struct SettingsLabelView: View {
    var actionButton: Bool
    let image: String
    let title: String
    
    var body: some View {
        Button {
            actionButton
        } label: {
            HStack {
                Image(systemName: image)
                Text(title)
            }
        }
    }
}

#Preview {
    SettingsLabelView(actionButton: false, image: "text.book.closed", title: "Regulamin")
}
