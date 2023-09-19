//
//  Swifties.swift
//  Mobile_project
//
//  Created by Maylis Ametowoglo on 06/09/2023.
//

import Foundation
import SwiftUI

class Swifties: ObservableObject {
    // Définition des propriétés de l'objet Swifties
    private(set) var gamePlan: [GamePlan.Question] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var flags: String = ""
    @Published private(set) var currentName: String = ""
    @Published private(set) var currentId : Int = 0
    @Published private(set) var name: [String] = []
    //@Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    @Published private(set) var currentFlag : String = ""

    // Initialisateur de la classe Swifties
    init() {
        Task.init {
            await fetchAPI()
        }
    }
    
    // Fonction pour récupérer les données depuis l'API
    func fetchAPI() async {
        guard let url = URL(string: "http://localhost:3000/questions") else { fatalError("Missing URL")}
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("🍩🍩🍩🍩🍩🍩🍩🍩")
            //print(response)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")}
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(GamePlan.self, from: data)
            
            print(data)
            
            // Mise à jour des propriétés de l'objet Swifties avec les données récupérées
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
                self.length = self.gamePlan.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching Swifties : \(error)")
        }
    }
    
    // Fonction pour obtenir des réponses aléatoires
    func getRandomAnswers(count: Int) -> [String] {
        //tableau vide pour stocker les réponses aléatoires
        var randomAnswers: [String] = []
        
        // Répète le processus 'count' fois pour générer le nombre requis de réponses aléatoires
          for _ in 0..<count {
              // Génère un index aléatoire compris entre 0 et le nombre total de noms disponibles
              let randomIndex = Int.random(in: 0..<name.count)
              
              // Récupère le nom correspondant à l'index aléatoire et l'ajoute au tableau des réponses aléatoires
              let randomAnswer = name[randomIndex]
              randomAnswers.append(randomAnswer)
          }
          return randomAnswers
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)

        if index < length {
            let randomIndex = Int.random(in: 0..<gamePlan.count)
            currentFlag = self.gamePlan[randomIndex].Flag
            let randomAnswers = getRandomAnswers(count: 4)
            
//            currentId = self.gamePlan[randomIndex].ID
            
            currentName = self.gamePlan[randomIndex].Name
            //print(currentFlag)
            //flags = currentFlag.flags.png
            // answerChoices = currentFlag.answers
        }
        
    }
    
    func goToNextFlag() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
//    func selectAnswer(answer:Answer) {
//        answerSelected = true
//        if answer.isCorrect {
//            score += 1
//        }
//    }
}
