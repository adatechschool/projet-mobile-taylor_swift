//
//  Quiz.swift
//  Mobile_project
//
//  Created by Maylis Ametowoglo on 04/09/2023.
//

import Foundation


struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
