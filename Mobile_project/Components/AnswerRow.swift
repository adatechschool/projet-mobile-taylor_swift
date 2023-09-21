import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var swifties: Swifties
    
    // Texte de la réponse à afficher
    var answerText: String
    @State private var isSelected = false
    var isCorrect: Bool
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: isSelected ? (isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill") : "circle.fill")
                .font(.caption)

            // Affiche le texte de la réponse en gras
            Text(answerText)
                .bold()

            if isSelected {
                Spacer()

                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(swifties.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !swifties.answerSelected {
                isSelected.toggle()
                // Gérez la logique de réponse ici en utilisant answerText
                swifties.selectAnswer(answer: Answer(text: answerText, isCorrect: isCorrect))
            }
        }
    }
}





struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answerText: "Single", isCorrect: true)
            .environmentObject(Swifties())
    }
}
