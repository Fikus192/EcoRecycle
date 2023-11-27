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
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(coordinateRegion: $viewModel.coordinateRegion, showsUserLocation: true, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        LocationMarkerView()
                            .scaleEffect(viewModel.mapLocation == location ? 1 : 0.7)
                            .shadow(radius: 10)
                            .onTapGesture {
                                viewModel.showNextLocation(location: location)
                                withAnimation(.easeInOut) {
                                    viewModel.isLocationPreviewVisible = true
                                }
                            }
                    }
                }
                .ignoresSafeArea(edges: .top)
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    ZStack {
                        ForEach(viewModel.locations) { location in
                            if viewModel.mapLocation == location && viewModel.isLocationPreviewVisible {
                                LocationPreviewView(location: location)
                                    .shadow(color: Color.black.opacity(0.3), radius: 20)
                                    .padding(8)
                                    .transition(.asymmetric(
                                        insertion: .move(edge: .trailing),
                                        removal: .move(edge: .leading)))
                            }
                        }
                    }
                }
            }
            .toolbar {
                Button {
                    viewModel.isLocationSearchViewPresented.toggle()
                    viewModel.showNextLocation(location: viewModel.mapLocation)
                } label: {
                    Image(systemName: "text.magnifyingglass")
                        .font(.headline)
                        .padding(8)
                        .foregroundStyle(.primary)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                }
            }
            .navigationDestination(isPresented: $viewModel.isLocationSearchViewPresented) {
                LocationSearchView { location in
                    viewModel.mapLocation = location ?? Location.sampleLocation
                }
            }
        }
        .onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
