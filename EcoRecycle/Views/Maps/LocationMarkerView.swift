//
//  LocationMarkerView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 21/11/2023.
//

import SwiftUI

struct LocationMarkerView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .frame(width: 40)
                    .font(.headline)
                    .foregroundStyle(.accent)
                
                Image(systemName: "trash")
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .font(.title2)
            }
            
            Image(systemName: "triangle.fill")
                .foregroundStyle(.accent)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    LocationMarkerView()
}
