//
//  LocationPreviewView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 21/11/2023.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @ObservedObject private var viewModel = MapsViewModel()
    
    let location: Location
    
    var body: some View {
        HStack {
            titleSection
            
            VStack {
                infoButton
                routeButton
            }
        }
        .clipped()
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
        }
    }
}

#Preview {
    ZStack {
        Color.purple.ignoresSafeArea()
        LocationPreviewView(location: Location.sampleLocation)
    }
}

extension LocationPreviewView {
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.address)
                .font(.headline)
            HStack(spacing: 4) {
                Text(location.zipcode)
                Text(location.city)
            }
            .opacity(0.8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var infoButton: some View {
        Button {
            print("Info button tapped")
            viewModel.sheetLocation = location
            viewModel.isLocationInfoViewPresented.toggle()
        } label: {
            HStack(spacing: 4) {
                Text("Więcej")
                    .font(.headline)
                    .frame(width: 75, height: 35)
                Image(systemName: "info.circle")
            }
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var routeButton: some View {
        Button {
            viewModel.openMaps(coordinate: location.coordinate)
        } label: {
            HStack(spacing: 4) {
                Text("Wyznacz trasę")
                    .font(.headline)
                    .frame(width: 75, height: 65)
                Image(systemName: "car.top.lane.dashed.badge.steeringwheel")
            }
        }
        .accentColor(.blue)
        .buttonStyle(.borderedProminent)
    }
}
