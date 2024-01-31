//
//  SettingsView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import MailComposer
import SwiftUI

internal struct SettingsView: View {
    
    @ObservedObject private var viewModel = SettingsViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    internal var body: some View {
        NavigationView {
            VStack {
                viewModel.buildLogoView()
                    .padding(.top, 20)
                
                Form {
                    Section {
                        settingsToggleDarkMode
                        settingsToggleNotifications
                    }
                    
                    Section {
                        settingsPrivacyPolicyLabel
                        settingsTermsAndConditionsLabel
                    }
                    
                    Section {
                        settingsRatingLabel
                        settingsMailComposerLabel
                    }
                    
                    Section {
                        settingsAppVersionLabel
                    }
                }
                .foregroundColor(.primary)
                .font(.callout)
            }
        }
        .mailComposer(isPresented: $viewModel.showMailComposer, mailData: viewModel.mailData)
        .preferredColorScheme(viewModel.toggleDarkMode ? .dark : .light)
        .task {
            try? await NotificationManager.instance.requestAuthorization()
        }
        .onChange(of: scenePhase) { newValue in
            if newValue == .active {
                Task {
                    await NotificationManager.instance.getCurrentSettings()
                }
            }
        }
    }
}

internal struct SettingsView_Previews: PreviewProvider {
    internal static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var settingsToggleDarkMode: some View {
        Toggle(isOn: $viewModel.toggleDarkMode) {
            HStack {
                Image(systemName: "moon")
                Text("Tryb Ciemny")
            }
        }
    }
    
    private var settingsToggleNotifications: some View {
        SettingsLabelView(
            image: "bell",
            labelText: "Zezwól na Powiadomienia",
            actionButtonTitle: "") { _ in
                NotificationManager.instance.openSettings()
            }
    }
    
    private var settingsPrivacyPolicyLabel: some View {
        SettingsLabelView(
            image: "lock.doc",
            labelText: "Polityka Prywatności",
            actionButtonTitle: "") { _ in
                viewModel.showPrivacyPolicy.toggle()
            }
            .sheet(isPresented: $viewModel.showPrivacyPolicy) {
                PrivacyPolicyView()
                    .presentationDragIndicator(.visible)
            }
    }
    
    private var settingsTermsAndConditionsLabel: some View {
        SettingsLabelView(
            image: "text.book.closed",
            labelText: "Zasady i Warunki",
            actionButtonTitle: "") { _ in
                viewModel.showTermsAndConditions.toggle()
            }
            .sheet(isPresented: $viewModel.showTermsAndConditions) {
                TermsAndConditionsView()
                    .presentationDragIndicator(.visible)
            }
    }
    
    private var settingsRatingLabel: some View {
        SettingsLabelView(
            image: "star",
            labelText: "Oceń EcoRecycle",
            actionButtonTitle: "") { _ in
                viewModel.showRating.toggle()
            }
            .sheet(isPresented: $viewModel.showRating) {
                RatingView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
    }
    
    private var settingsMailComposerLabel: some View {
        SettingsLabelView(
            image: "paperplane",
            labelText: "Kontakt ze Wsparciem",
            actionButtonTitle: "") { _ in
                viewModel.showMailComposer.toggle()
            }
    }
    
    private var settingsAppVersionLabel: some View {
        HStack {
            Image(systemName: "apple.terminal")
            Text("Wersja aplikacji: \(Bundle.main.appVersion)")
        }
        .foregroundStyle(.secondary)
    }
    
}
