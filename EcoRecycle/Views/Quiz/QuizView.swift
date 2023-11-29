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
            .navigationDestination(isPresented: $vm.isQuestionViewPresented) {
                QuestionView()
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
