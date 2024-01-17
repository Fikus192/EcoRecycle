//
//  ScheduleLocationView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 08/01/2024.
//

import SwiftUI

struct ScheduleLocationView: View {
    
    @StateObject private var vm = ScheduleViewModel()
    var onLocationSelected: (Schedule?) -> Void
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.theme.secondaryText)
                    
                    TextField("Znajdź lokalizację...", text: $vm.searchText)
                        .overlay(
                            Image(systemName: "xmark.circle.fill")
                                .padding()
                                .offset(x: 10)
                                .foregroundStyle(Color.theme.secondaryText)
                                .opacity(vm.searchText.isEmpty ? 0.0 : 1.0)
                                .onTapGesture {
                                    vm.searchText = ""
                                }
                            
                            ,alignment: .trailing
                        )
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .strokeBorder(.secondary)
                }
                
                List {
                    ForEach(vm.schedules.filter {
                        vm.searchText.isEmpty || $0.city.localizedCaseInsensitiveContains(vm.searchText) || $0.street.localizedCaseInsensitiveContains(vm.searchText)
                    }) { schedule in
                        Button {
                            onLocationSelected(schedule)
                            vm.setAndSaveSelectedLocation(schedule)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            VStack(alignment: .leading) {
                                Text(schedule.city)
                                    .font(.title2.bold())
                                Text(schedule.street)
                                    .foregroundStyle(Color.theme.secondaryText)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarTitle("Wybierz swoją lokalizację", displayMode: .inline)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: CustomBackButtonView())
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}
