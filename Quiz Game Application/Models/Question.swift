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
        ]),
        Question(text: "What was the name of Captain Jack Sparrow's ship in Pirates of the Caribbean?", answers: [
            Answer(text: "Marauder", correct: false),
            Answer(text: "Black pearl", correct: true),
            Answer(text: "Black python", correct: false),
            Answer(text: "Slytherin", correct: false)
        ]),
        Question(text: "What is the rarest blood type?", answers: [
            Answer(text: "Group I", correct: true),
            Answer(text: "II", correct: false),
            Answer(text: "III", correct: false),
            Answer(text: "IV", correct: false)
        ]),
        Question(text: "Fe is the symbol for what chemical element?", answers: [
            Answer(text: "Zinc", correct: false),
            Answer(text: "Hydrogen", correct: false),
            Answer(text: "Fluorine", correct: false),
            Answer(text: "Iron", correct: true)
        ]),
        Question(text: "What language is spoken by the most people on earth?", answers: [
            Answer(text: "Chinese", correct: true),
            Answer(text: "Spanish", correct: false),
            Answer(text: "English", correct: false),
            Answer(text: "Arabic", correct: false)
        ]),
        Question(text: "How many hearts does an octopus have?", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "2", correct: false),
            Answer(text: "3", correct: true),
            Answer(text: "4", correct: false)
        ]),
        Question(text: "What is the largest planet in our solar system?", answers: [
            Answer(text: "Jupiter", correct: true),
            Answer(text: "Saturn", correct: false),
            Answer(text: "Neptune", correct: false),
            Answer(text: "Sun", correct: false)
        ]),
        Question(text: "Who painted the ceiling of the Sistine Chapel?", answers: [
            Answer(text: "Pablo Picasso", correct: false),
            Answer(text: "Leonardo da Vinci", correct: false),
            Answer(text: "Michelangelo", correct: true),
            Answer(text: "Vincent van Gogh", correct: false)
        ]),
        Question(text: "What is the largest ocean on Earth?", answers: [
            Answer(text: "Indian", correct: false),
            Answer(text: "Quiet", correct: true),
            Answer(text: "Atlantic", correct: false),
            Answer(text: "Southern", correct: false)
        ]),
        Question(text: "Who painted the Mona Lisa?", answers: [
            Answer(text: "Vincent van Gogh", correct: false),
            Answer(text: "Leonardo da Vinci", correct: true),
            Answer(text: "Pablo Picasso", correct: false),
            Answer(text: "Claude Monet", correct: false)
        ]),
        Question(text: "Which country consumes the most chocolate?", answers: [
            Answer(text: "Spain", correct: false),
            Answer(text: "Germany", correct: false),
            Answer(text: "North America", correct: false),
            Answer(text: "Switzerland", correct: true)
        ]),
        Question(text: "What is another word for sodium chloride?", answers: [
            Answer(text: "Salt", correct: true),
            Answer(text: "Sugar", correct: false),
            Answer(text: "Chlorine", correct: false),
            Answer(text: "Bleach", correct: false)
        ]),
        Question(text: "Which river is the longest in the world?", answers: [
            Answer(text: "Amazon", correct: false),
            Answer(text: "Congo", correct: false),
            Answer(text: "Nile", correct: true),
            Answer(text: "Hudson", correct: false)
        ]),
        Question(text: "How many days are in February in a leap year?", answers: [
            Answer(text: "28", correct: false),
            Answer(text: "29", correct: true),
            Answer(text: "30", correct: false),
            Answer(text: "31", correct: false)
        ]),
        Question(text: "How many degrees are in a circle?", answers: [
            Answer(text: "360", correct: true),
            Answer(text: "270", correct: false),
            Answer(text: "180", correct: false),
            Answer(text: "90", correct: false)
        ]),
        Question(text: "Which city is known as the City of Love?", answers: [
            Answer(text: "Rome", correct: false),
            Answer(text: "Barcelona", correct: false),
            Answer(text: "New York", correct: false),
            Answer(text: "Paris", correct: true)
        ])
    ]
}
