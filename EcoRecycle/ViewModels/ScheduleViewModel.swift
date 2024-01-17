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
    @Published var selectedWasteType: Schedule.WasteType = .tworzywaSztuczne
    
    private let selectedLocationKey: String = "selectedLocationKey"
    private var cancellables = Set<AnyCancellable>()
    
    // Search text bar in ScheduleLocationView
    @Published var searchText: String = ""
    var cancellable: AnyCancellable?
    
    init() {
        let schedules = Schedule.allSchedules
        self.schedules = schedules
        
        // Check save data using UserDefaults
        if let savedLocationData = UserDefaults.standard.data(forKey: selectedLocationKey) {
           let savedLocation = try? JSONDecoder().decode(Schedule.self, from: savedLocationData)
            selectedLocation = savedLocation
        }
        
        // Search TextField Watching
        cancellable = $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink(receiveValue: { value in
                self.fetchLocations(value: value)
            })
        
        // Save selected location
        NotificationCenter.default.publisher(for: UIScene.willDeactivateNotification)
            .sink { [weak self] _ in
                self?.saveSelectedLocation()
            }
            .store(in: &cancellables)
    }
    
    private func fetchLocations(value: String) { }
    
    private func saveSelectedLocation() {
        if let selectedLocation = selectedLocation {
            let locationData = try? JSONEncoder().encode(selectedLocation)
            UserDefaults.standard.set(locationData, forKey: selectedLocationKey)
        }
    }
    
    internal func setAndSaveSelectedLocation(_ schedule: Schedule) {
        selectedLocation = schedule
        saveSelectedLocation()
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
    
    @ViewBuilder
    internal func scheduleDescriptionView() -> some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                Text("Dostęp do harmonogramu")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Spacer()
                Image(systemName: "info.circle")
                    .foregroundStyle(Color.theme.secondaryText)
            }
            .padding()
            
            Text("Aby uzyskać dostęp do harmonogramu odpadów należy wybrać lokalizację klikając przycisk powyżej.")
                .multilineTextAlignment(.center)
                .font(.callout)
                .foregroundStyle(Color.theme.secondaryText)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.thinMaterial)
        )
        .padding()
    }
}
