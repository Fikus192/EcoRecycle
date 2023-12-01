//
//  MainView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import Combine
import SwiftUI

struct MainView: View {
    
    @ObservedObject private var viewModel = SettingsViewModel()
    @StateObject private var tabSelectionManager = TabSelectionManager()
    
    var body: some View {
        TabView(selection: $tabSelectionManager.selectedTab) {
            ScheduleView()
                .tabItem {
                    Label("Harmonogram", systemImage: "calendar")
                }
                .tag(TabSelection.schedule)
            
            QuizView()
                .tabItem {
                    Label("Quiz", systemImage: "leaf")
                }
                .tag(TabSelection.quiz)
            
            MapView()
                .tabItem {
                    Label("Mapa", systemImage: "mappin.and.ellipse")
                }
                .tag(TabSelection.map)
            
            NotificationView()
                .tabItem {
                    Label("Powiadomienia", systemImage: "bell")
                }
                .tag(TabSelection.notifications)
            
            SettingsView()
                .tabItem {
                    Label("Ustawienia", systemImage: "gearshape")
                }
                .tag(TabSelection.settings)
            
        }
        .environment(\.colorScheme, viewModel.toggleDarkMode ? .dark : .light)
        .accentColor(.accent)
        .onReceive(tabSelectionManager.$selectedTab) { _ in
            HapticManager.instance.impact(style: .soft)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
