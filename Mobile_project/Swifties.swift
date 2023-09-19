//
//  Swifties.swift
//  Mobile_project
//
//  Created by Maylis Ametowoglo on 06/09/2023.
//

import Foundation
import SwiftUI

class Swifties: ObservableObject {
    private(set) var gamePlan: [GamePlan.Question] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var flags: String = ""
    @Published private(set) var currentName: String = ""
    @Published private(set) var currentId : Int = 0
    
    
    
    //@Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    @Published private(set) var currentFlag : String = ""

    
    init() {
        Task.init {
            await fetchAPI()
        }
    }
    
    func fetchAPI() async {
        guard let url = URL(string: "http://localhost:3000/questions") else { fatalError("Missing URL")}
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("🍩🍩🍩🍩🍩🍩🍩🍩")
            //print(response)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")}
            let decoder = JSONDecoder()
           // decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(GamePlan.self, from: data)
            
            print(data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                self.currentFlag = ""
                self.currentName = ""
                self.currentId = 0
                
                print("🍄🍄🍄🍄🍄🍄🍄🍄🍄🍄🍄🍄")
                
                //print("Print rebase")
            
    
                self.gamePlan = decodedData.questions
                print("🍩🍩🍩🍩")
                
                print(self.gamePlan[4].Flag)

                self.length = self.gamePlan.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching Swifties : \(error)")
        }
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
            
            currentId = self.gamePlan[randomIndex].ID
            
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
    
    func selectAnswer(answer:Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
