//
//  SettingsViewModel.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 14/09/2023.
//

import SwiftUI

internal class SettingsViewModel: ObservableObject {
    @Published var toggleDarkMode: Bool = false
    @Published var toggleNotifications: Bool = false
    @Published var showPrivacyPolicy: Bool = false
    @Published var showTermsAndConditions: Bool = false
    @Published var showRating: Bool = false
    @Published var showMailComposer: Bool = false
    
    @ViewBuilder
    internal func buildLogoView() -> some View {
        VStack(alignment: .center, spacing: 10) {
            Image("ecoRecycle")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(25)
                .shadow(radius: 10)
            
            Text(Bundle.main.appName)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}
