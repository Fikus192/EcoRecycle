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
    
    @StateObject private var viewModel = QuizViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                Text(viewModel.quizInfo?.title ?? "")
                    .customTitle()
                
                Text(viewModel.quizInfo?.subtitle ?? "")
                    .foregroundStyle(.primary)
            }
            
            viewModel.primaryButton(text: "Rozpocznij Quiz")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(.thinMaterial)
        .task {
            do {
                try await viewModel.fetchData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
