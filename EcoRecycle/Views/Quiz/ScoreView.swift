//
//  ScoreView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 29/11/2023.
//

import SwiftUI

struct ScoreView: View {
    @Environment(\.dismiss) private var dismiss
    var score: CGFloat
    var onDimiss: () -> ()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gratulacje!")
                .customTitle()
            
            Text("Właśnie ukończyłeś Quiz zwiększający świadomość segregacji odpadów.")
                .multilineTextAlignment(.center)
                .font(.headline)
            
            Text("Twój wynik: \(String(format: "%.0f", score)) / 10")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.accent)
            
            CustomButton(title: "Wróć") {
                onDimiss()
                dismiss()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(.thinMaterial)
    }
}
