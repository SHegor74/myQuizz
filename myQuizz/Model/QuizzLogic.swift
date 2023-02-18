//
//  QuizzLogic.swift
//  myQuizz
//
//  Created by Egor Naberezhnov on 07.02.2023.
//

import Foundation

struct QuizzLogic {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], cA: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], cA: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], cA: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], cA: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], cA: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], cA: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], cA: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], cA: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], cA: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], cA: "Australia")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func progressBar() -> Float{
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func questionText() -> String {
        return quiz[questionNumber].question
    }
    
    func firstAnswerText() -> String {
        return quiz[questionNumber].answer[0]
    }
    func secondAnswerText() -> String {
        return quiz[questionNumber].answer[1]
    }
    func thirdAnswerText() -> String {
        return quiz[questionNumber].answer[2]
    }
    
    mutating func getNextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
}
