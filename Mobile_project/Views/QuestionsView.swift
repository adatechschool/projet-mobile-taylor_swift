import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var swifties: Swifties
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Flag Quiz")
                    .lilacTitle()
                    
                Spacer()
                
                // Affiche le numéro de la question actuelle sur le nombre total de questions
                //Text("\(swifties.index + 1) out of 10")
                Text("\(swifties.index + 1) out of \(swifties.length)")
                
                // Définit la couleur du texte en utilisant une couleur personnalisée
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: swifties.progress)
            
            VStack(alignment: .center, spacing: 20) {
                // Affiche une image asynchrone à partir de l'URL stockée dans "swifties.currentFlag"
                AsyncImage(url: URL(string: swifties.currentFlag))
                    .frame(maxWidth: 320, maxHeight: 390)
                
                // Génère 4 réponses aléatoires et stocke les réponses dans "randomAnswers"
                var randomAnswers = swifties.getRandomAnswers(count: 3)
            
                
                // Pour chaque index dans la plage 0..<randomAnswers.count, exécute le bloc de code suivant
                ForEach(0..<randomAnswers.count, id: \.self) { index in
                    // Cette boucle génère des boutons pour chaque réponse aléatoire

                    Button {
                        // Récupère la réponse sélectionnée
                        let selectedAnswer = randomAnswers[index]
                        if selectedAnswer == swifties.currentName {
                           
                        }
                        // Passe à la prochaine question
                        swifties.goToNextQuestion()
                    } label: {
                        // Utilise la vue AnswerRow avec le texte de la réponse aléatoire
                        AnswerRow(answerText: randomAnswers[index])
                    }
                    .background(swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                    // Définit la couleur de fond du bouton en fonction de l'état de la réponse sélectionnée
                }
                Text("\(randomAnswers[0])")
                Text("\(randomAnswers[1])")
                Text("\(randomAnswers[2])")
                

                Button(action: {
                    swifties.setQuestion() // Passe à la prochaine question
                }) {
                    //count: count:3 génère 3 réponses, [0] accède au 1er élément du tableau
                    AnswerRow(answerText: swifties.currentName) // Utilisez le nom actuel comme texte pour le bouton
                        .background(swifties.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                    // Définit la couleur de fond du bouton en fonction de l'état de la réponse sélectionnée
                }
                
                Spacer() // Ajoute un espace flexible pour pousser les éléments vers le haut de l'écran
            }
        }
        .padding() // Ajoute un espacement intérieur
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Définit la taille maximale de la vue pour remplir l'écran
        .background(Color(red: 0.98, green: 0.92, blue: 0.84)) // Définit la couleur de fond de la vue
        .navigationBarHidden(true) // Supprime le bouton 'Back' de la barre de navigation
    }
}
