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
                AsyncImage(url: URL(string: swifties.flags))
                    .frame(width: 320, height: 213)
                
                AnswerRow(answer : Answer(text: "false", isCorrect: true))
                    .environmentObject(swifties)
                AnswerRow(answer: Answer(text: "true", isCorrect: false))
                    .environmentObject(swifties)

                
                
                
            }
            
            PrimaryButton(text: "Next")
            
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
