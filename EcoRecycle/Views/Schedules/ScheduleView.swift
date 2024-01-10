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
                        }
                        Spacer()
                        Text("Harmonogram Odbioru")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.theme.accent)
                        Spacer()
                        CircleButtonView(iconName: "bell.fill")
                    }
                    Spacer(minLength: 0)
                    
                    List(vm.schedules) { schedule in
                        Button {
                            vm.showAddLocation.toggle()
                        } label: {
                            RectangleButtonView(city: schedule.city, street: schedule.street)
                        }
                        .listRowSeparator(.hidden)
                        
                        vm.scheduleDetailsView(for: schedule)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationDestination(isPresented: $vm.showInfo) {
                ScheduleInfoView()
            }
            .navigationDestination(isPresented: $vm.showAddLocation) {
                ScheduleLocationView()
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
