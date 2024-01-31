//
//  RectangleButtonView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 08/01/2024.
//

import SwiftUI

struct RectangleButtonView: View {
    
    let city: String?
    let street: String?
    
    var body: some View {
        ZStack {
            HStack {
                
                LocationMarkerView()
                    .foregroundStyle(Color.theme.secondaryText)
                    .offset(y: 15)
                    .scaleEffect(0.8)
                
                VStack(alignment: .leading) {
                    Text(city ?? "Dodaj lokalizację")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(street ?? "Dodaj i zapisz swoją lokalizację")
                        .font(.callout)
                        .foregroundStyle(Color.theme.secondaryText)
                }
                
                Spacer()
                
                Image(systemName: "chevron.down")
                
            }
            .padding(.horizontal, 15)
        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.theme.secondaryText, lineWidth: 1)
                .frame(maxWidth: .infinity)
        )
    }
}

#Preview {
    RectangleButtonView(city: "Tychy", street: "ul. Nałkowskiej")
}
