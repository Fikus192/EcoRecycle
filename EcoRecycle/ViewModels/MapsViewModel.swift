//
//  MapsViewModel.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 13/11/2023.
//

import MapKit
import SwiftUI

internal enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 51.91, longitude: 19.13)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 10.05, longitudeDelta: 10.05)
}

final class MapsViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var coordinateRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
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
