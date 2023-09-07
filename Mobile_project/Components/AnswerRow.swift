//
//  AnswerRow.swift
//  Mobile_project
//
//  Created by kady on 05/09/2023.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var swifties: Swifties
    var answer: Answer
    @State private var isSelected = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)

    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(swifties.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !swifties.answerSelected {
                isSelected = true
                swifties.selectAnswer(answer: answer)
            }
            
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer:Answer(text: "Single", isCorrect: false))
            .environmentObject(Swifties())
    }
}
