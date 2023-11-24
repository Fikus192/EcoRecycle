//
//  MapsViewModel.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 13/11/2023.
//

import Combine
import MapKit
import SwiftUI

final class MapsViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // MARK: - PSZOK Locations
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var coordinateRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var isLocationInfoViewPresented: Bool = false
    @Published var isLocationSearchViewPresented: Bool = false
    @Published var selectedLocation: Location? = nil
    @Published var sheetLocation: Location? = nil {
        didSet {
            print("Sheet location set: \(String(describing: sheetLocation))")
            objectWillChange.send()
        }
    }
    // Search text bar in LocationSearchView
    @Published var searchText: String = ""
    var cancellable: AnyCancellable?
    
    override init() {
        let locations = Location.allLocations
        self.locations = locations
        self.mapLocation = locations.first ?? Location.sampleLocation
        super.init()
        self.updateMapRegion(location: locations.first ?? Location.sampleLocation)
        
        // Search TextField Watching
        cancellable = $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink(receiveValue: { value in
                self.fetchPlaces(value: value)
            })
    }
    
    private func fetchPlaces(value: String) {
        
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            coordinateRegion = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    
    internal func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
        }
    }
    
    internal func openMaps(coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
    }
    
    // MARK: - User Location
    
    internal var locationManager: CLLocationManager?
    
    internal func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show an alert")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Twoja lokalizacja jest ograniczona, prawdopodobnie ze względu na kontrolę rodzicielską.")
        case .denied:
            print("Odmówiłeś pozwolenia na lokalizację tej aplikacji. Przejdź do ustawień, aby to zmienić.")
        case .authorizedAlways, .authorizedWhenInUse:
            coordinateRegion = MKCoordinateRegion(
                center: locationManager.location!.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
    }
    
    internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
