//
//  ScheduleInfoView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 04/01/2024.
//

import SwiftUI

struct ScheduleInfoView: View {
    
    @StateObject private var vm = ScheduleViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("", selection: $vm.selectedWasteType) {
                    ForEach(Schedule.WasteType.allCases) { wasteType in
                        Text(wasteType.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                
                ScheduleWasteInfoView(wasteType: vm.selectedWasteType)
                
                Spacer()
            }
            .navigationBarTitle("Informacje odpadowe", displayMode: .inline)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: CustomBackButtonView())
        }
    }
}

#Preview {
    ScheduleInfoView()
}
