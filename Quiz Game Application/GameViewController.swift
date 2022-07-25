//
//  GameViewController.swift
//  Quiz Game Application
//
//  Created by luqrri on 25.07.22.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var gameModels = [Question]()
    
    var currentQuestion: Question?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQuestions()
        configureUI(question: gameModels.first!)
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
            if let index = gameModels.firstIndex(where: { $0.text == question.text }) {
                if index < gameModels.count - 1 {
                    let nextQuestion = gameModels[index + 1]
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
                }
                else {
                    let alert = UIAlertController(title: "Done", message: "You won", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                    present(alert, animated: true)
                }
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
