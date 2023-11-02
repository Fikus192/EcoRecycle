//
//  RatingView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 31/10/2023.
//

import SwiftUI

internal struct RatingView: View {
    
    @State var rating: Int = 0
    @State private var maximumRating = 5
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                Text("Oceń Aplikację EcoRecycle")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                
                ZStack {
                    starsView
                        .overlay(overlayView.mask(starsView))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.ultraThickMaterial)
    }
}

#Preview {
    RatingView()
}

extension RatingView {
    
    private var starsView: some View {
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = number
                        }
                    }
            }
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
}
