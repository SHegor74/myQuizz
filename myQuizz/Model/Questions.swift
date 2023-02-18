//
//  Questions.swift
//  myQuizz
//
//  Created by Egor Naberezhnov on 07.02.2023.
//

import Foundation

struct Question {
    let question: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], cA: String) {
        question = q
        answer = a
        correctAnswer = cA
    }
}
