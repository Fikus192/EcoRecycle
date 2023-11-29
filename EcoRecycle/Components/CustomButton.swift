//
//  CustomButton.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 27/11/2023.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var onClick: () -> ()
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(title)
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(.accent)
                .cornerRadius(30)
                .shadow(radius: 10)
        }
    }
}
