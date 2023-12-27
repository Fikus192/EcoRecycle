//
//  ScheduleView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import SwiftUI

struct ScheduleView: View {
    
    @StateObject private var vm = ScheduleViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(vm.schedules) { schedule in
                        VStack {
                            ScrollView(.horizontal) {
                                HStack(spacing: 10) {
                                    Text(schedule.city)
                                        .font(.headline)
                                    Text(schedule.street)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Tworzywa Sztuczne: \(schedule.pickup.tworzywaSztuczne.joined(separator: ", "))")
                                    Text("Papier: \(schedule.pickup.papier.joined(separator: ", "))")
                                    Text("Szkło: \(schedule.pickup.szklo.joined(separator: ", "))")
                                    Text("Biodegradowalne: \(schedule.pickup.biodegradowalne.joined(separator: ", "))")
                                    Text("Zmieszane: \(schedule.pickup.zmieszane.joined(separator: ", "))")
                                    Text("Popiół: \(schedule.pickup.popiol.joined(separator: ", "))")
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Eco")
        }
        .frame(maxWidth: .infinity)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
