//
//  QuizView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import Firebase
import FirebaseFirestoreSwift
import SwiftUI

struct QuizView: View {
    @StateObject private var vm = QuizViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text(vm.quizInfo?.title ?? "")
                        .customTitle()
                    
                    Text(vm.quizInfo?.subtitle ?? "")
                        .foregroundStyle(.primary)
                }
                
                CustomButton(title: "Rozpocznij Quiz") {
                    vm.isQuestionViewPresented.toggle()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(.thinMaterial)
            .toolbar {
                Button {
                    vm.showDictionaryView.toggle()
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
            .navigationDestination(isPresented: $vm.isQuestionViewPresented) {
                QuestionView()
            }
            .navigationDestination(isPresented: $vm.showDictionaryView) {
                DictionaryView()
                    .navigationTitle("Słownik odpadowy")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden()
                    .navigationBarItems(leading: CustomBackButtonView())
            }
            .task {
                do {
                    try await vm.fetchData()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
