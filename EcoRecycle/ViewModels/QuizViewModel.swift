//
//  QuizViewModel.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 27/11/2023.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

final class QuizViewModel: ObservableObject {
    @AppStorage("log_status") private var logStatus: Bool = false
    
    @Published var quizInfo: Info?
    @Published var questions: [Question] = []
    
    internal func fetchData() async throws {
        try await loginUserAnonymous()
        
        let info = try await Firestore.firestore().collection("Quiz").document("Info").getDocument().data(as: Info.self)
        let questions = try await Firestore.firestore().collection("Quiz").document("Info").collection("Questions").getDocuments()
            .documents
            .compactMap {
                try $0.data(as: Question.self)
            }
        
        await MainActor.run(body: {
            self.quizInfo = info
            self.questions = questions
        })
    }
    
    internal func loginUserAnonymous() async throws {
        if !logStatus {
            try await Auth.auth().signInAnonymously()
        }
    }
    
    @ViewBuilder
    internal func primaryButton(text: String) -> some View {
        Text(text)
            .foregroundStyle(.white)
            .padding()
            .padding(.horizontal)
            .background(.accent)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}
