//
//  CircleButtonView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 04/01/2024.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: Color.theme.secondaryText.opacity(0.25),
                radius: 10
            )
            .padding()
        
    }
}

#Preview {
    Group {
        CircleButtonView(iconName: "info")
            .previewLayout(.sizeThatFits)
        
        CircleButtonView(iconName: "bell")
            .previewLayout(.sizeThatFits)
    }
}
