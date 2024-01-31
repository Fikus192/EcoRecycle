//
//  ScheduleReminderView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 19/01/2024.
//

import SwiftUI

struct ScheduleReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isShowingReminder: Bool
    @State private var selectedDate = Date()
    @State private var notificationTitle = ""
    @State private var notificationBody = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Section("Tytuł:") {
                        TextField("Wprowadź tytuł (opcjonalnie)", text: $notificationTitle)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .strokeBorder(Color.theme.secondaryText)
                            }
                            .overlay(
                                Image(systemName: "xmark.circle.fill")
                                    .padding()
                                    .offset(x: 10)
                                    .foregroundStyle(Color.theme.secondaryText)
                                    .opacity(notificationTitle.isEmpty ? 0.0 : 1.0)
                                    .onTapGesture {
                                        notificationTitle = ""
                                    }
                                
                                ,alignment: .trailing
                            )
                    }
                    .font(.headline)
                    .padding(.horizontal, 10)
                    
                    Section("Treść:") {
                        TextField("Wprowadź treść (opcjonalnie)", text: $notificationBody)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .strokeBorder(Color.theme.secondaryText)
                            }
                            .overlay(
                                Image(systemName: "xmark.circle.fill")
                                    .padding()
                                    .offset(x: 10)
                                    .foregroundStyle(Color.theme.secondaryText)
                                    .opacity(notificationBody.isEmpty ? 0.0 : 1.0)
                                    .onTapGesture {
                                        notificationBody = ""
                                    }
                                
                                ,alignment: .trailing
                            )
                    }
                    .font(.headline)
                    .padding(.horizontal, 10)
                }
                
                Section {
                    DatePicker("Wybierz datę i godzinę", selection: $selectedDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                        .environment(\.locale, Locale(identifier: "pl_PL"))
                        .datePickerStyle(.graphical)
                        .tint(Color.theme.accent)
                        .padding()
                }
                .background {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.theme.secondaryText, lineWidth: 1)
                }
                .padding(.vertical, 20)
                
                Button {
                    NotificationManager.instance.scheduleNotification(
                        for: selectedDate,
                        title: notificationTitle.isEmpty ? nil : notificationTitle,
                        body: notificationBody.isEmpty ? nil : notificationBody
                    )
                    isShowingReminder.toggle()
                } label: {
                    Text("Ustaw przypomnienie")
                        .font(.headline)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 15)
                        .background {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.theme.secondaryText, lineWidth: 1)
                        }
                }
            }
            .foregroundStyle(Color.theme.accent)
            .background(Color.theme.background)
            .cornerRadius(25)
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(Color.theme.accent)
                    }
                }
            }
        }
    }
}

#Preview {
    ScheduleReminderView(isShowingReminder: .constant(true))
}
