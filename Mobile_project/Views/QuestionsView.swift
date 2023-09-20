import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var swifties: Swifties
    @State private var selectedAnswer: String? = nil
    @State private var answerSelected = false // Variable pour suivre si la réponse a été sélectionnée ou non

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
                    Button(action: {
                        // Met à jour selectedAnswer avec la réponse sélectionnée
                        selectedAnswer = randomAnswers[index]
                        if selectedAnswer == swifties.currentName {
                            swifties.goToNextQuestion()
                        }
                    }) {
                        AnswerRow(answerText: randomAnswers[index], isCorrect: randomAnswers[index] == swifties.currentName)
                    }
                    .background(swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                }
                
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.98, green: 0.92, blue: 0.84))
        .navigationBarHidden(true)
    }
}
