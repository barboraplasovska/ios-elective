//
//  ContentView.swift
//  SimpleQuizz
//
//  Created by Barunka Plasovska on 24/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showQuestion = false
    @State var showAnswer = false
    
    @State var currentQuestionIndex = 0
    
    var questions = [
        "What is 7 + 7?",
        "What is the capital of France?",
        "From what is cognac made of?"]
    
    var answers = ["14", "Paris", "Grapes"]
    
    var body: some View {
        VStack {
            Button("Show Question") {
                if (!showQuestion)
                {
                    showQuestion.toggle()
                }
                
                if (showAnswer) {
                    showAnswer.toggle()
                }
                
                currentQuestionIndex = currentQuestionIndex + 1
                if (currentQuestionIndex >= questions.count)
                {
                    currentQuestionIndex = 0
                }
                
            }
            Spacer()
            if (showQuestion)
            {
                Text(questions[currentQuestionIndex])
                Spacer()
            }
            Divider()
            Spacer()
            Button("Show Answer")
            {
                showAnswer.toggle()
            }
            Spacer()
            if (showAnswer)
            {
                Text(answers[currentQuestionIndex])
                Spacer()
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
