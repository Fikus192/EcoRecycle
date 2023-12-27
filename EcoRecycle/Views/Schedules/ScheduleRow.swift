//
//  ScheduleRow.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 21/12/2023.
//

import SwiftUI

struct ScheduleRow: View {
    
    let schedule: Schedule
    let color: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 20, height: 50)
                    .foregroundStyle(color)
            }
            
            Text(schedule.city)
            Text(schedule.street)
        }
        .clipped()
        .padding(.vertical, 20)
        .padding(.horizontal, 15)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
        }
    }
}

#Preview {
    ScheduleRow(schedule: Schedule.sampleSchedule, color: .yellow)
}
