//
//  NotificationView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import SwiftUI

struct NotificationView: View {
    
    @ObservedObject private var notificationManager = NotificationManager.instance
    @State private var isShowingDeleteAllAlert: Bool = false
    @State private var selectedNotification: Notification? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(notificationManager.notifications) { notification in
                        NotificationRow(notification: notification)
                            .contextMenu {
                                Button("Usuń") {
                                    selectedNotification = notification
                                }
                            }
                    }
                    .onDelete(perform: deleteNotification)
                }
                .listStyle(.plain)
                .padding()
            }
            .background(Color.theme.background)
            .navigationTitle("Historia Powiadomień")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingDeleteAllAlert.toggle()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(notificationManager.notifications.isEmpty ? Color.clear : Color.theme.red)
                    }
                    .alert(isPresented: $isShowingDeleteAllAlert) {
                        Alert(
                            title: Text("Usuń wszystkie powiadomienia"),
                            message: Text("Czy na pewno chcesz usunąć wszystkie powiadomienia?"),
                            primaryButton: .destructive(Text("Usuń")) {
                                deleteAllNotifications()
                            },
                            secondaryButton: .cancel(Text("Anuluj")))
                    }
                }
            }
            .actionSheet(item: $selectedNotification) { notification in
                ActionSheet(
                    title: Text("Usuń powiadomienie"),
                    message: Text("Czy na pewno chcesz usunąć to powiadomienie?"),
                    buttons: [
                        .destructive(Text("Usuń")) {
                            deleteNotification(notification)
                        },
                        .cancel(Text("Anuluj"))
                    ]
                )
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

extension NotificationView {
    
    private func deleteNotification(at offsets: IndexSet) {
        if let index = offsets.first {
            notificationManager.notifications.remove(at: index)
        }
    }

    private func deleteNotification(_ notification: Notification) {
        if let index = notificationManager.notifications.firstIndex(where: { $0.id == notification.id }) {
            notificationManager.notifications.remove(at: index)
        }
    }

    private func deleteAllNotifications() {
        notificationManager.notifications.removeAll()
    }
}
