//
//  QuizViewModel.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 27/11/2023.
//

import Combine
import Firebase
import FirebaseFirestoreSwift
import SwiftUI

@MainActor
final class QuizViewModel: ObservableObject {
    @AppStorage("log_status") private var logStatus: Bool = false
    
    @Published var quizInfo: Info?
    @Published private(set) var questions: [Question] = []
    @Published private(set) var trashes: [Trash] = []
    
    @Published var isQuestionViewPresented: Bool = false
    @Published var currentQuestion: Int = 0
    @Published var score: CGFloat = 0
    @Published var progress: CGFloat = 0
    @Published var showScoreView: Bool = false
    @Published var showDictionaryView: Bool = false
    @Published var isAnswerCorrect: Bool = false
    @Published var accessibilityLabel: String = ""
    @Published var isAccessibilityActive: Bool = false
    
    // Search text bar in DictionaryView
    @Published var searchText: String = ""
    var cancellable: AnyCancellable?
    
    init() {
        cancellable = $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink(receiveValue: { value in
                self.fetchTrash(value: value)
            })
    }
    
    private func fetchTrash(value: String) { }
    
    internal func fetchData() async throws {
        try await loginUserAnonymous()
        
        let info = try await Firestore.firestore().collection("Quiz").document("Info").getDocument().data(as: Info.self)
        let questions = try await Firestore.firestore().collection("Quiz").document("Info").collection("Questions").getDocuments()
            .documents
            .compactMap {
                try $0.data(as: Question.self)
            }
        
        let trashes = try await Firestore.firestore().collection("Quiz").document("Dictionary").collection("Trash")
            .getDocuments()
            .documents
            .compactMap {
                try $0.data(as: Trash.self)
            }
        
        let shuffledQuestions = questions.shuffled().prefix(10)
        
        self.trashes.sort { $0.category < $1.category }
        
        await MainActor.run(body: {
            self.quizInfo = info
            self.questions = Array(shuffledQuestions)
            self.trashes = trashes
        })
    }
    
    internal func loginUserAnonymous() async throws {
        if !logStatus {
            try await Auth.auth().signInAnonymously()
        }
    }
    
    @ViewBuilder
    internal func progressBar(progress: CGFloat) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundStyle(Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundStyle(.accent)
                .cornerRadius(10)
        }
    }
    
    @ViewBuilder
    internal func answerRow(_ option: String, _ tint: Color) -> some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
                .foregroundStyle(.accent)
                .accessibilityHidden(true)
            
            Text(option)
                .bold()
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.black)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(tint.opacity(0.15))
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(tint.opacity(tint == .gray ? 0.15 : 1), lineWidth: 2)
                }
        }
    }
    
    @ViewBuilder
    internal func questionView(_ question: Question) -> some View {
        let green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
        let red = Color(red: 0.71, green: 0.094, blue: 0.1)
        
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(question.question)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.accent)
                
                VStack(spacing: 12) {
                    ForEach(question.options, id: \.self) { option in
                        ZStack {
                            self.answerRow(option, .gray)
                                .opacity(question.answer == option && question.tappedAnswer != "" ? 0 : 1)
                            self.answerRow(option, green)
                                .opacity(question.answer == option && question.tappedAnswer != "" ? 1 : 0)
                            self.answerRow(option, red)
                                .opacity(question.tappedAnswer == option && question.tappedAnswer != question.answer ? 1 : 0)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            guard self.questions[self.currentQuestion].tappedAnswer == "" else { return }
                            
                            withAnimation(.easeInOut) {
                                self.questions[self.currentQuestion].tappedAnswer = option
                                if question.answer == option {
                                    self.score += 1
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 15)
            }
            .padding(.horizontal)
            .padding(.vertical, 15)
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.white)
            }
        }
    }
    
    internal func handleNextButtonTap() {
        if currentQuestion == (questions.count - 1) {
            showScoreView.toggle()
        } else {
            withAnimation(.easeInOut) {
                if questions.indices.contains(currentQuestion) {
                    currentQuestion += 1
                    progress = CGFloat(Double(currentQuestion) / Double(questions.count - 1) * 350)
                }
            }
        }
    }
    
    internal func accessibilityLabelForCurrentQuestion(question: Question) {
        let currentQuestionIndex = currentQuestion + 1
        let totalQuestionsCount = questions.count
        
        var feedback = ""
        
        if question.tappedAnswer == question.answer {
            feedback = "Poprawna odpowiedź! Aktualnie jesteś na pytaniu \(currentQuestionIndex) z \(totalQuestionsCount)."
        } else {
            feedback = "Niestety, błędna odpowiedź. Poprawna odpowiedź to \(question.answer). Aktualnie jesteś na pytaniu \(currentQuestionIndex) z \(totalQuestionsCount)."
        }
        
        accessibilityLabel = feedback
    }
}
