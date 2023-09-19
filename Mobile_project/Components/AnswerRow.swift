//
//  AnswerRow.swift
//  Mobile_project
//
//  Created by kady on 05/09/2023.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var swifties: Swifties
    
    // Texte de la réponse à afficher
    var answerText: String
    @State private var isSelected = false

    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)

            // Affiche le texte de la réponse en gras
            Text(answerText)
                .bold()

            if isSelected {
                Spacer()

                Image(systemName: "checkmark")
                    .foregroundColor(green)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(swifties.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? green : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !swifties.answerSelected {
                isSelected.toggle()
                // Gérez la logique de réponse ici en utilisant answerText
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answerText: "Single")
            .environmentObject(Swifties())
    }
}
