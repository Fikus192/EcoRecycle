//
//  LocationInfoView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 22/11/2023.
//

import MapKit
import SwiftUI

struct LocationInfoView: View {
    
    @ObservedObject private var viewModel = MapsViewModel()
    
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                mapLayer
                
                VStack(alignment: .leading, spacing: 8) {
                    addressSection
                    
                    Divider()
                    
                    workTimeSection
                    
                    Divider()
                    
                    contactSection
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: CustomBackButtonView())
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    LocationInfoView(location: Location.sampleLocation)
}

extension LocationInfoView {
    
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinate) {
                LocationMarkerView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
    
    private var addressSection: some View {
        Section {
            HStack {
                Image(systemName: "house")
                Text("Adres placówki:")
            }
            .font(.title2)
            
            Text(location.name)
            Text(location.address)
            
            HStack(spacing: 4) {
                Text(location.zipcode)
                Text(location.city)
            }
        }
    }
    
    private var workTimeSection: some View {
        Section {
            HStack {
                Image(systemName: "clock")
                Text("Godziny otwarcia:")
            }
            .font(.title2)
            
            Text(location.opening_hours)
            Text(location.opening_hours_weekend)
        }
    }
    
    private var contactSection: some View {
        Section {
            HStack {
                Image(systemName: "person.crop.circle")
                Text("Dane kontakowe:")
            }
            .font(.title2)
            
            Text(location.phone)
            Text(location.mail)
        }
    }
}
