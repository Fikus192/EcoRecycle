//
//  ScheduleRow.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 21/12/2023.
//

import SwiftUI

struct ScheduleRow: View {
    let color: Color
    let dates: [String]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 20, height: 50)
                    .foregroundStyle(color)
            }
            
            VStack {
                ForEach(dates, id: \.self) { date in
                    Text(date)
                }
            }
            
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
    ScheduleRow(color: .yellow, dates: ["12 Stycznia"])
        .previewLayout(.sizeThatFits)
}
