//
//  ScheduleView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import SwiftDate
import SwiftUI

struct ScheduleView: View {
    
    @StateObject private var vm = ScheduleViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background layer
                Color.theme.background
                
                // Content Layer
                VStack {
                    HStack {
                        Button {
                            vm.showInfo.toggle()
                        } label: {
                            CircleButtonView(iconName: "info")
                                .accessibilityHidden(true)
                        }
                        .accessibilityLabel(Text("Informacje odpadowe"))
                        
                        Spacer()
                        
                        Text("Harmonogram Odbioru")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.theme.accent)
                        
                        Spacer()
                        
                        Button {
                            vm.isShowingReminder.toggle()
                        } label: {
                            CircleButtonView(iconName: "bell.fill")
                                .accessibilityHidden(true)
                        }
                        .accessibilityLabel(Text("Ustaw przypomnienie"))
                        .sheet(isPresented: $vm.isShowingReminder) {
                            ScheduleReminderView(isShowingReminder: $vm.isShowingReminder)
                                .presentationDragIndicator(.visible)
                        }
                    }
                    Spacer(minLength: 0)
                    
                    if let selectedLocation = vm.selectedLocation {
                        List([selectedLocation]) { schedule in
                            Button {
                                vm.showAddLocation.toggle()
                            } label: {
                                RectangleButtonView(city: schedule.city, street: schedule.street)
                            }
                            .listRowSeparator(.hidden)
                            
                            vm.scheduleDetailsView(for: schedule)
                        }
                        .listStyle(.plain)
                        
                    } else {
                        VStack {
                            Button {
                                vm.showAddLocation.toggle()
                            } label: {
                                RectangleButtonView(city: "Wybierz swoją lokalizację", street: "Kliknij aby wybrać")
                            }
                            .padding()
                            .listRowSeparator(.hidden)
                            
                            vm.scheduleDescriptionView()
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                }
            }
            .navigationDestination(isPresented: $vm.showInfo) {
                ScheduleInfoView()
            }
            .navigationDestination(isPresented: $vm.showAddLocation) {
                ScheduleLocationView { schedule in
                    vm.selectedLocation = schedule ?? Schedule.sampleSchedule
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
