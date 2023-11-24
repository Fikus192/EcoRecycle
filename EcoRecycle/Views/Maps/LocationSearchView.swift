//
//  LocationSearchView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 23/11/2023.
//

import SwiftUI

struct LocationSearchView: View {
    
    @StateObject private var viewModel = MapsViewModel()
    var onLocationSelected: (Location?) -> Void
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                
                TextField("Znajdź punkt zbiórki...", text: $viewModel.searchText)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .strokeBorder(.secondary)
            }
            
            List {
                ForEach(viewModel.locations.filter {
                    viewModel.searchText.isEmpty ||
                    $0.name.localizedCaseInsensitiveContains(viewModel.searchText) ||
                    $0.address.localizedCaseInsensitiveContains(viewModel.searchText) ||
                    $0.zipcode.localizedCaseInsensitiveContains(viewModel.searchText) ||
                    $0.city.localizedCaseInsensitiveContains(viewModel.searchText)
                }) { location in
                    Button {
                        onLocationSelected(location)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        VStack(alignment: .leading) {
                            Text(location.name)
                                .font(.title2.bold())
                            Text(location.address)
                                .foregroundStyle(.secondary)
                            
                            HStack(spacing: 4) {
                                Text(location.zipcode)
                                Text(location.city)
                            }
                            .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
