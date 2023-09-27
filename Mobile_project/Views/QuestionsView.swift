import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var swifties: Swifties
    @State private var selectedAnswer: String? = nil
    @State private var shuffledAnswers: [String] = []

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Flag Quiz")
                    .lilacTitle()
                Spacer()

                VStack(alignment: .leading) {
                    Text("Question \(swifties.index + 1)/10")
                        .font(.subheadline)
                        .foregroundColor(Color("AccentColor"))

                    Text("Score: \(swifties.score)")
                        .font(.subheadline)
                        .foregroundColor(Color("AccentColor"))
                }

                .foregroundColor(Color("AccentColor"))
                .fontWeight(.heavy)
            }

            ProgressBar(progress: swifties.progress)

            VStack(alignment: .center, spacing: 20) {
                AsyncImage(url: URL(string: swifties.currentFlag))
                    .frame(maxWidth: 320, maxHeight: 390)

                ForEach(shuffledAnswers, id: \.self) { answerText in
                    Button(action: {
                        // Vérifiez si la réponse est correcte
                        let isCorrect = answerText == swifties.currentName
                        
                        // Mettez à jour selectedAnswer avec la réponse sélectionnée
                        selectedAnswer = answerText
                        
                        if isCorrect {
                            // Si la réponse est correcte, passez automatiquement à la question suivante
                            swifties.goToNextQuestion()
                            
                            // Réinitialisez selectedAnswer pour permettre une nouvelle sélection
                            selectedAnswer = nil

                            // Générez de nouvelles réponses pour la prochaine question
                            generateRandomAnswers()
                        }
                    }) {
                        AnswerRow(answerText: answerText, isCorrect: answerText == swifties.currentName)
                    }
                    .background(selectedAnswer == answerText ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                }

                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.98, green: 0.92, blue: 0.84))
        .navigationBarHidden(true)
        .onAppear {
            // Cette logique sera exécutée une seule fois lorsque la vue apparaît pour la première fois
            generateRandomAnswers()
        }
    }

    private func generateRandomAnswers() {
        // Initialiser vos valeurs ici
        let randomAnswers = swifties.getRandomAnswers(count: 3)
        shuffledAnswers = randomAnswers.shuffled()
    }
}
