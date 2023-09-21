import Foundation
import SwiftUI

class Swifties: ObservableObject {
    // Propriétés pour gérer l'état du jeu
    private(set) var gamePlan: [GamePlan.Question] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var flags: String = ""
    @Published private(set) var currentName: String = ""
    @Published private(set) var currentId : Int = 0
    @Published private(set) var name: [String] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    @Published private(set) var currentFlag : String = ""
    @Published private(set) var selectedAnswer : String = ""
    
    // Initialisateur de la classe Swifties
    init() {
        // Appelle la fonction fetchAPI de manière asynchrone lors de l'initialisation
        Task.init {
            await fetchAPI()
        }
        resetAnswerSelection()
    }
    
    // Fonction pour récupérer les données depuis l'API
    func fetchAPI() async {
        guard let url = URL(string: "http://localhost:3000/questions") else { fatalError("URL manquante")}
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("🍩🍩🍩🍩🍩🍩🍩🍩")
            
            // Vérifie si la réponse du serveur est OK (statusCode 200)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Erreur lors de la récupération des données")}
            
            // Décode les données JSON en utilisant JSONDecoder
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GamePlan.self, from: data)
            
            print(data)
            
            // Met à jour les propriétés de l'objet Swifties avec les données récupérées
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                self.currentFlag = ""
                self.currentName = ""
                self.currentId = 0
                self.gamePlan = decodedData.questions
                self.length = self.gamePlan.count
                self.name = decodedData.questions.map { $0.Name }
                self.gamePlan = decodedData.questions
                self.setQuestion()
                self.selectedAnswer = self.currentName
            }
        } catch {
            print("Erreur lors de la récupération des données Swifties : \(error)")
        }
    }
    
    // Fonction pour obtenir des réponses aléatoires
    func getRandomAnswers(count: Int) -> [String] {
        var randomAnswers: [String] = []
        
        for _ in 0..<count {
            let randomIndex = Int.random(in: 0..<name.count)
            let randomAnswer = name[randomIndex]
            randomAnswers.append(randomAnswer)
        }
        randomAnswers.append(currentName)
        return randomAnswers
    }
    
    // Met à jour le nom actuel en fonction du drapeau actuel
    func updateCurrentNameForCurrentFlag() {
        if let question = gamePlan.first(where: { $0.Flag == currentFlag }) {
            currentName = question.Name
        }
    }
    
    // Passe à la question suivante
    func goToNextQuestion() {
        let length = 10
        if index + 1 < length {
            index += 1
            print("Passage à la question suivante")
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    // Définit la question actuelle
    func setQuestion() {
        answerSelected = false
        resetAnswerSelection()
        progress = CGFloat(Double(index + 1) / Double(length) * 350)

        if index < length {
            let randomIndex = Int.random(in: 0..<gamePlan.count)
            currentFlag = self.gamePlan[randomIndex].Flag
            updateCurrentNameForCurrentFlag() // Met à jour currentName en fonction de currentFlag
        }
    }
    
    // Réinitialise la sélection de réponse
    func resetAnswerSelection() {
        selectedAnswer = ""
    }
    
    // Sélectionne une réponse et met à jour le score si nécessaire
    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        if answer.isCorrect {
            score += 1
        }
    }
}
