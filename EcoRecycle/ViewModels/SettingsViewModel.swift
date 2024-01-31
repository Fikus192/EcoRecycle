//
//  SettingsViewModel.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 14/09/2023.
//

import MailComposer
import SwiftUI

internal class SettingsViewModel: ObservableObject {
    @AppStorage("isDarkMode") var toggleDarkMode: Bool = false

    @Published var showPrivacyPolicy: Bool = false
    @Published var showTermsAndConditions: Bool = false
    @Published var showRating: Bool = false
    @Published var showMailComposer: Bool = false
    
    internal var mailData: MailComposer.MailData {
        .init(
            subject: "Zgłoszenie Problemu",
            recipients: ["support@ecorecycle.com"],
            body: """
                Model: \(UIDevice.current.modelName)
                Wersja iOS: \(UIDevice.current.systemVersion)
                Wersja aplikacji: \(Bundle.main.appVersion)
                Opisz swoje zgłoszenie poniżej
                --------------------------------------
            """
        )
    }
    
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
