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
        VStack(spacing: 40) {
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
                Text("\(swifties.currentId)")


                
//                ForEach(swifties.answerChoices, id: \.id) {
//                    answer in
//                    AnswerRow(answer: answer)
//                        .environmentObject(swifties)
//                }
            }
            
            Button {
                swifties.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            //.disabled(!swifties.answerSelected)
            
            
            Button {
               // swifties.goToNextQuestion()
            } label: {
                PrimaryButton(text: "\(swifties.currentName)" , background: swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            
            Button {
               // swifties.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Answer 2", background: swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            
            Button {
               // swifties.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Answer 3", background: swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            
            Button {
               // swifties.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Answer 4", background: swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            
            
            
            Spacer()
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
