//
//  NotificationRow.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 30/01/2024.
//

import SwiftUI

struct NotificationRow: View {
    let notification: Notification
    
    var body: some View {
        HStack {
            Text(notification.title)
            Spacer()
            Text(formatDate(notification.date))
                .foregroundStyle(Color.theme.secondaryText)
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pl_PL")
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: date)
    }
}

#Preview {
    NotificationRow(notification: Notification(id: UUID.init(), title: "Tytuł", body: "Treść", date: Date.now))
}
