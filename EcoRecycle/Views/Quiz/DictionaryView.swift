//
//  DictionaryView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 01/12/2023.
//

import Firebase
import FirebaseFirestoreSwift
import SwiftUI

struct DictionaryView: View {
    @StateObject private var vm = QuizViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                
                TextField("Nazwa odpadu...", text: $vm.searchText)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .strokeBorder(.secondary)
            }
            
            List {
                ForEach(vm.trashes.sorted(by: { $0.category < $1.category }).filter {
                    vm.searchText.isEmpty ||
                    $0.name.localizedCaseInsensitiveContains(vm.searchText) ||
                    $0.category.localizedCaseInsensitiveContains(vm.searchText) }) { trash in
                        HStack {
                            Circle()
                                .fill(trash.color)
                                .frame(width: 30, height: 30)
                                .shadow(radius: 5)
                            VStack(alignment: .leading) {
                                Text(trash.name)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.primary)
                                Text(trash.category)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.horizontal, 5)
                        }
                }
            }
            .listStyle(.plain)
            .padding(.horizontal, -20)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .task {
            do {
                try await vm.fetchData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    DictionaryView()
}
