import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var swifties: Swifties
    
    // Texte de la réponse à afficher
    var answerText: String
    var isCorrect: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)

            // Affiche le texte de la réponse en gras
            Text(answerText)
                .bold()

            if swifties.answerSelected {
                Spacer()
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(isCorrect ? .green : .red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(swifties.answerSelected ? (isCorrect ? .green : .red) : .primary)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !swifties.answerSelected {
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
