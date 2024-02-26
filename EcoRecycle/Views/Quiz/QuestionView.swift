//
//  QuestionView.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 27/11/2023.
//

import Firebase
import FirebaseFirestoreSwift
import SwiftUI

struct QuestionView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = QuizViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text(vm.quizInfo?.title ?? "")
                    .customTitle()
                
                Spacer()
                
                Text("\(vm.currentQuestion + 1) z \(vm.questions.count)")
                    .foregroundStyle(.accent)
                    .fontWeight(.heavy)
            }
            
            vm.progressBar(progress: vm.progress)
            
            VStack(alignment: .center, spacing: 20) {
                GeometryReader { _ in
                    ForEach(vm.questions.indices, id: \.self) { question in
                        if vm.currentQuestion == question {
                            vm.questionView(vm.questions[vm.currentQuestion])
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                                .accessibilityAction {
                                    if !vm.questions[vm.currentQuestion].tappedAnswer.isEmpty {
                                        vm.accessibilityLabelForCurrentQuestion(question: vm.questions[vm.currentQuestion])
                                    }
                                } label: {
                                    Text(vm.accessibilityLabel)
                                }
                        }
                    }
                }
                .padding(.vertical, 15)
                
                CustomButton(title: vm.currentQuestion == (vm.questions.count - 1) ? "Zakończ" : "Dalej") {
                    vm.handleNextButtonTap()
                }
                .background(vm.questions.indices.contains(vm.currentQuestion) && vm.questions[vm.currentQuestion].tappedAnswer.isEmpty ?
                            Color.theme.secondaryText : Color.theme.accent)
                .cornerRadius(30)
                .accessibilityHint(Text("Aby przejść dalej musisz odpowiedzieć na pytanie."))
                .disabled(vm.questions.indices.contains(vm.currentQuestion) ? vm.questions[vm.currentQuestion].tappedAnswer.isEmpty : true)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.thinMaterial)
        .navigationBarBackButtonHidden()
        .task {
            do {
                try await vm.fetchData()
            } catch {
                print(error.localizedDescription)
            }
        }
        .fullScreenCover(isPresented: $vm.showScoreView) {
            ScoreView(score: vm.score / CGFloat(vm.questions.count) * 10) {
                dismiss()
            }
        }
    }
}

#Preview {
    QuestionView()
}
