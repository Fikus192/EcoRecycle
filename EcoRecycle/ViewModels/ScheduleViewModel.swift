//
//  ScheduleViewModel.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 14/12/2023.
//

import Combine
import SwiftUI

final class ScheduleViewModel: ObservableObject {
    
    @Published private(set) var schedules: [Schedule]
    @Published var showInfo: Bool = false
    @Published var showAddLocation: Bool = false
    @Published var selectedLocation: Schedule?
    
    init() {
        let schedules = Schedule.allSchedules
        self.schedules = schedules
    }
    
    @ViewBuilder
    internal func scheduleDetailsView(for schedule: Schedule) -> some View {
        ForEach(schedule.pickup.allWasteTypes, id: \.self) { wasteType in
            Section(schedule.pickup.convertIntoPolish(for: wasteType)) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(schedule.pickup.dates(for: wasteType), id: \.self) { date in
                            ScheduleRow(
                                color: schedule.pickup.color(forWasteType: wasteType),
                                dates: [date])
                        }
                    }
                }
                .listRowSeparator(.hidden, edges: .bottom)
            }
        }
    }
}
