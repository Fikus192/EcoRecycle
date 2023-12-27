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
    
    init() {
        let schedules = Schedule.allSchedules
        self.schedules = schedules
    }
}
