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
                            image: "lock.doc",
                            labelText: "Polityka Prywatności",
                            actionButtonTitle: "") { _ in
                                viewModel.showPrivacyPolicy.toggle()
                            }
                            .sheet(isPresented: $viewModel.showPrivacyPolicy) {
                                PrivacyPolicyView()
                            }
                        
                        SettingsLabelView(
                            image: "text.book.closed",
                            labelText: "Zasady i Warunki",
                            actionButtonTitle: "") { _ in
                                viewModel.showTermsAndConditions.toggle()
                            }
                            .sheet(isPresented: $viewModel.showTermsAndConditions) {
                                TermsAndConditionsView()
                            }
                    }
                    
                    Section {
                        SettingsLabelView(
                            image: "star",
                            labelText: "Oceń EcoRecycle",
                            actionButtonTitle: "") { _ in
                                viewModel.showRating.toggle()
                            }
                        
                        SettingsLabelView(
                            image: "paperplane",
                            labelText: "Kontakt ze Wsparciem",
                            actionButtonTitle: "") { _ in
                                viewModel.showMailComposer.toggle()
                            }
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
