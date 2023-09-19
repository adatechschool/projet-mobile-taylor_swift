//
//  QuestionsView.swift
//  Mobile_project
//
//  Created by kady on 05/09/2023.
//

import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var swifties: Swifties
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Flag Quiz")
                    .lilacTitle()
                
                Spacer()
                
                Text("\(swifties.index + 1) out of \(swifties.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: swifties.progress)
            
            VStack(alignment: .center, spacing: 20) {
                AsyncImage(url: URL(string: swifties.currentFlag))
                    .frame(maxWidth: 320, maxHeight: 390)
                
                let randomAnswers = swifties.getRandomAnswers(count: 3)
                
                ForEach(0..<randomAnswers.count, id: \.self) { index in
                    Button {
                        // Gérez la logique de réponse ici
                    } label: {
                        AnswerRow(answerText: randomAnswers[index])
                    }
                    .background(swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                }
                
                Button(action: {
                    swifties.goToNextQuestion()
                }) {
                    AnswerRow(answerText: swifties.getRandomAnswers(count: 4)[0])
                        .background(swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                }
                
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.98, green: 0.92, blue: 0.84))
        .navigationBarHidden(true)//Supprime bouton 'Back'
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
            .environmentObject(Swifties())
    }
}
