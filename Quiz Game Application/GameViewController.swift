//
//  GameViewController.swift
//  Quiz Game Application
//
//  Created by luqrri on 25.07.22.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var gameModels = [Question](), questionIndex = 0, used: [Int] = []
    
    @IBOutlet weak var progressSlider: UISlider!
    var currentQuestion: Question?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQuestions()
        questionIndex = Int.random(in: 0..<gameModels.count)
        used.append(questionIndex)
        configureUI(question: gameModels[questionIndex])
    }
    
    private func configureUI(question: Question) {
        label.text = question.text
        currentQuestion = question
        table.reloadData()
    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool {
        question.answers.contains(where: { $0.text == answer.text }) && answer.correct
    }
    
    private func setupQuestions() {
        gameModels.append(Question(text: "2 + 2 = ?", answers: [
            Answer(text: "3", correct: false),
            Answer(text: "4", correct: true),
            Answer(text: "5", correct: false),
            Answer(text: "6", correct: false)
        ]))
        gameModels.append(Question(text: "How old is a creator of this game?", answers: [
            Answer(text: "18", correct: false),
            Answer(text: "19", correct: false),
            Answer(text: "20", correct: false),
            Answer(text: "21", correct: true)
        ]))
        gameModels.append(Question(text: "Where is Big Ben situated?", answers: [
            Answer(text: "Berlin", correct: false),
            Answer(text: "Rio-de-Janeiro", correct: false),
            Answer(text: "London", correct: true),
            Answer(text: "Prague", correct: false)
        ]))
        gameModels.append(Question(text: "7 - 5 = ?", answers: [
            Answer(text: "2", correct: true),
            Answer(text: "3", correct: false),
            Answer(text: "4", correct: false),
            Answer(text: "5", correct: false)
        ]))
        gameModels.append(Question(text: "8 % 3 = ?", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "2", correct: true),
            Answer(text: "3", correct: false),
            Answer(text: "4", correct: false)
        ]))
        gameModels.append(Question(text: "79 + 23 = ?", answers: [
            Answer(text: "100", correct: false),
            Answer(text: "101", correct: false),
            Answer(text: "102", correct: true),
            Answer(text: "103", correct: false)
        ]))
        gameModels.append(Question(text: "91 - 69 = ?", answers: [
            Answer(text: "20", correct: false),
            Answer(text: "21", correct: false),
            Answer(text: "22", correct: true),
            Answer(text: "23", correct: false)
        ]))
        gameModels.append(Question(text: "2 + 2 * 2 = ?", answers: [
            Answer(text: "2", correct: false),
            Answer(text: "4", correct: false),
            Answer(text: "5", correct: false),
            Answer(text: "6", correct: true)
        ]))
        gameModels.append(Question(text: "11 * 6 / 22 = ?", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "2", correct: false),
            Answer(text: "3", correct: true),
            Answer(text: "4", correct: false)
        ]))
        gameModels.append(Question(text: "56 / 8 = ?", answers: [
            Answer(text: "7", correct: true),
            Answer(text: "8", correct: false),
            Answer(text: "9", correct: false),
            Answer(text: "10", correct: false)
        ]))
    }
    
    //Table view functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ans", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestion else { return }
        let answer = question.answers[indexPath.row]
        
        if checkAnswer(answer: answer, question: question) {
            progressSlider.value += 10
            if progressSlider.value == 100 {
                let alert = UIAlertController(title: "Done", message: "You won", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                present(alert, animated: true)
            }
            else {
                while true {
                    questionIndex = Int.random(in: 0..<gameModels.count)
                    if !used.contains(questionIndex) {
                        break
                    }
                }
                used.append(questionIndex)
                let nextQuestion = gameModels[questionIndex]
                currentQuestion = nil
                configureUI(question: nextQuestion)
            }
        }
        else {
            let alert = UIAlertController(title: "Wrong", message: "You did a mistake", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
    
}

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let correct: Bool
}
