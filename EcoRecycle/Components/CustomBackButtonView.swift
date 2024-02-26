//
//  CustomBackButtonView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 10/01/2024.
//

import SwiftUI

struct CustomBackButtonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrowshape.turn.up.backward")
                .accessibilityHidden(true)
        }
        .accessibilityLabel(Text("Wróć"))
    }
}

#Preview {
    CustomBackButtonView()
}
