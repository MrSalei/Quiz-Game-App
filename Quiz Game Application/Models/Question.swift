//
//  Question.swift
//  Quiz Game Application
//
//  Created by luqrri on 26.07.22.
//

import Foundation

struct Question {
    let text: String
    let answers: [Answer]
}

extension Question {
    static var questions = [
        Question(text: "2 + 2 = ?", answers: [
            Answer(text: "3", correct: false),
            Answer(text: "4", correct: true),
            Answer(text: "5", correct: false),
            Answer(text: "6", correct: false)
        ]),
        Question(text: "How old is a creator of this game?", answers: [
            Answer(text: "18", correct: false),
            Answer(text: "19", correct: false),
            Answer(text: "20", correct: false),
            Answer(text: "21", correct: true)
        ]),
        Question(text: "Where is Big Ben situated?", answers: [
            Answer(text: "Berlin", correct: false),
            Answer(text: "Rio-de-Janeiro", correct: false),
            Answer(text: "London", correct: true),
            Answer(text: "Prague", correct: false)
        ]),
        Question(text: "7 - 5 = ?", answers: [
            Answer(text: "2", correct: true),
            Answer(text: "3", correct: false),
            Answer(text: "4", correct: false),
            Answer(text: "5", correct: false)
        ]),
        Question(text: "8 % 3 = ?", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "2", correct: true),
            Answer(text: "3", correct: false),
            Answer(text: "4", correct: false)
        ]),
        Question(text: "79 + 23 = ?", answers: [
            Answer(text: "100", correct: false),
            Answer(text: "101", correct: false),
            Answer(text: "102", correct: true),
            Answer(text: "103", correct: false)
        ]),
        Question(text: "91 - 69 = ?", answers: [
            Answer(text: "20", correct: false),
            Answer(text: "21", correct: false),
            Answer(text: "22", correct: true),
            Answer(text: "23", correct: false)
        ]),
        Question(text: "2 + 2 * 2 = ?", answers: [
            Answer(text: "2", correct: false),
            Answer(text: "4", correct: false),
            Answer(text: "5", correct: false),
            Answer(text: "6", correct: true)
        ]),
        Question(text: "11 * 6 / 22 = ?", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "2", correct: false),
            Answer(text: "3", correct: true),
            Answer(text: "4", correct: false)
        ]),
        Question(text: "56 / 8 = ?", answers: [
            Answer(text: "7", correct: true),
            Answer(text: "8", correct: false),
            Answer(text: "9", correct: false),
            Answer(text: "10", correct: false)
        ]),
        Question(text: "How many blue lines on the USA flag?", answers: [
            Answer(text: "6", correct: false),
            Answer(text: "7", correct: false),
            Answer(text: "13", correct: false),
            Answer(text: "0", correct: true)
        ]),
        Question(text: "Who from the given characters is Harry Potter's enemy?", answers: [
            Answer(text: "Ron Weasley", correct: false),
            Answer(text: "Neville Longbottom", correct: false),
            Answer(text: "Draco Malfoy", correct: true),
            Answer(text: "Hermione Granger", correct: false)
        ]),
        Question(text: "What bird is the smallest one?", answers: [
            Answer(text: "Fly", correct: false),
            Answer(text: "Colibri", correct: true),
            Answer(text: "Parrot", correct: false),
            Answer(text: "Sparrow", correct: false)
        ]),
        Question(text: "Which planet is the hottest?", answers: [
            Answer(text: "Venus", correct: true),
            Answer(text: "Sun", correct: false),
            Answer(text: "Jupiter", correct: false),
            Answer(text: "Mars", correct: false)
        ])
    ]
}
