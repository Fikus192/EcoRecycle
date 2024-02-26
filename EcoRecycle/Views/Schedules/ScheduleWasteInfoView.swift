//
//  ScheduleWasteInfoView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 12/01/2024.
//

import SwiftUI

struct ScheduleWasteInfoView: View {
    
    let wasteType: Schedule.WasteType
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // Can throw
                Section {
                    HStack {
                        Text("Co można wyrzucać:")
                            .foregroundColor(.primary)
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(Color.theme.green)
                            .accessibilityHidden(true)
                        
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    
                    ForEach(WasteInfo.info(for: wasteType)?.canThrow ?? [""], id: \.self) { waste in
                        HStack {
                            Image(systemName: "circlebadge.fill")
                                .font(.caption2)
                                .accessibilityHidden(true)
                            Text(waste)
                                .foregroundStyle(Color.theme.secondaryText)
                        }
                    }
                    .foregroundColor(.primary)
                    .padding(.vertical, 2)
                }
                
                // Cannot throw
                Section {
                    HStack {
                        Text("Czego nie można wyrzucać:")
                            .foregroundColor(.primary)
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(Color.theme.red)
                            .accessibilityHidden(true)
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    
                    ForEach(WasteInfo.info(for: wasteType)?.cannotThrow ?? [""], id: \.self) { waste in
                        HStack {
                            Image(systemName: "circlebadge.fill")
                                .font(.caption2)
                                .accessibilityHidden(true)
                            Text(waste)
                                .foregroundStyle(Color.theme.secondaryText)
                        }
                    }
                    .foregroundColor(.primary)
                    .padding(.vertical, 2)
                }
                
                // Remember
                Section {
                    HStack {
                        Text("O czym pamiętać:")
                            .foregroundColor(.primary)
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(Color.theme.secondaryText)
                            .accessibilityHidden(true)
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    
                    ForEach(WasteInfo.info(for: wasteType)?.remember ?? [""], id: \.self) { waste in
                        HStack {
                            Image(systemName: "circlebadge.fill")
                                .font(.caption2)
                                .accessibilityHidden(true)
                            Text(waste)
                                .foregroundStyle(Color.theme.secondaryText)
                        }
                    }
                    .foregroundColor(.primary)
                    .padding(.vertical, 2)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 5)
        }
    }
}

#Preview {
    ScheduleWasteInfoView(wasteType: .biodegradowalne)
}
