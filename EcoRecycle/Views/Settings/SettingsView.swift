//
//  SettingsView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import SwiftUI

internal struct SettingsView: View {
    
    @ObservedObject private var viewModel = SettingsViewModel()
    
    internal var body: some View {
        NavigationView {
            VStack {
                viewModel.buildLogoView()
                    .padding(.top, 20)
                
                Form {
                    Section {
                        Toggle(isOn: $viewModel.toggleDarkMode) {
                            HStack {
                                Image(systemName: "moon")
                                Text("Tryb Ciemny")
                            }
                        }
                        
                        Toggle(isOn: $viewModel.toggleNotifications) {
                            HStack {
                                Image(systemName: "bell")
                                Text("Zezwól na Powiadomienia")
                            }
                        }
                    }
                    
                    Section {
                        SettingsLabelView(
                            actionButton: viewModel.showPrivacyPolicy == true,
                            image: "lock.doc",
                            title: "Polityka Prywatności"
                        )
                        
                        SettingsLabelView(
                            actionButton: viewModel.showTermsAndConditions == true,
                            image: "text.book.closed",
                            title: "Zasady i Warunki"
                        )
                    }
                    
                    Section {
                        SettingsLabelView(
                            actionButton: viewModel.showRating == true,
                            image: "star",
                            title: "Oceń EcoRecycle"
                        )
                        
                        SettingsLabelView(
                            actionButton: viewModel.showMailComposer == true,
                            image: "paperplane",
                            title: "Kontakt ze Wsparciem"
                        )
                    }
                    
                    Section {
                        HStack {
                            Image(systemName: "apple.terminal")
                            Text("Wersja aplikacji: \(Bundle.main.appVersion)")
                        }
                        .foregroundStyle(.secondary)
                    }
                }
                .foregroundColor(.primary)
                .font(.callout)
            }
        }
    }
}

internal struct SettingsView_Previews: PreviewProvider {
    internal static var previews: some View {
        SettingsView()
    }
}
