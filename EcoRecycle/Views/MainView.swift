//
//  MainView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        TabView {
            ScheduleView()
                .tabItem {
                    Label("Harmonogram", systemImage: "calendar")
                }
            
            QuizView()
                .tabItem {
                    Label("Quiz", systemImage: "leaf")
                }
            
            MapView()
                .tabItem {
                    Label("Mapa", systemImage: "mappin.and.ellipse")
                }
            
            NotificationView()
                .tabItem {
                    Label("Powiadomienia", systemImage: "bell")
                }
            
            SettingsView()
                .tabItem {
                    Label("Ustawienia", systemImage: "gearshape")
                }
            
        }
        .environment(\.colorScheme, viewModel.toggleDarkMode ? .dark : .light)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
