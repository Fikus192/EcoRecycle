//
//  MapView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    @StateObject private var viewModel = MapsViewModel()
    @State private var locations: [Location] = Location.allLocations
    
    var body: some View {
        Map(coordinateRegion: $viewModel.coordinateRegion, showsUserLocation: true, annotationItems: locations) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                ZStack {
                    Circle()
                        .fill(.green)
                        .shadow(radius: 4)
                    
                    Image(systemName: "trash")
                        .padding(4)
                        .foregroundStyle(.white)
                        .shadow(radius: 1)
                    
                }
            }
        }
        .onAppear {
            //viewModel.checkIfLocationServicesIsEnabled()
        }
        .ignoresSafeArea(edges: .top)
    }
}

extension MapView {
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
