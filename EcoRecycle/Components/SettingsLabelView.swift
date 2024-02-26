//
//  SettingsLabelView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 21/09/2023.
//

import SwiftUI

struct SettingsLabelView: View {
    let image: String
    let labelText: String
    let actionButtonTitle: String
    let action: (Bool) -> Void
    
    @State private var isButtonTapped: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .accessibilityHidden(true)
            
            Text(labelText)
                .accessibilityElement(children: .combine)
            
            Button(action: {
                isButtonTapped.toggle()
                action(isButtonTapped)
            }) {
                Text(actionButtonTitle)
            }
        }
        .accessibilityAddTraits(.isButton)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("\(labelText), \(actionButtonTitle) przycisk"))
        .accessibilityHint(Text("Stuknij dwukrotnie w przycisk"))
    }
}
