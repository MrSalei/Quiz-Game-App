//
//  Randomizer.swift
//  Quiz Game Application
//
//  Created by luqrri on 26.07.22.
//

import Foundation

class Randomizer {
    static func getRandomCount(questions: [Question]) -> Int {
        return Int.random(in: 0..<questions.count)
    }
}
