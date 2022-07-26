//
//  GameViewController.swift
//  Quiz Game Application
//
//  Created by luqrri on 25.07.22.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    
    private var questions: [Question] = [], currentQuestion: Question?, questionIndex = 0, used: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQuestions(with: Question.questions)
        questionIndex = Randomizer.getRandomCount(questions: questions)
        used.append(questionIndex)
        configureUI(question: questions[questionIndex])
    }
    
    private func configureUI(question: Question) {
        label.text = question.text
        currentQuestion = question
        table.reloadData()
    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool {
        question.answers.contains(where: { $0.text == answer.text }) && answer.correct
    }
    
    private func setupQuestions(with questions: [Question]) {
        self.questions = questions
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
                    questionIndex = Randomizer.getRandomCount(questions: questions)
                    if !used.contains(questionIndex) {
                        break
                    }
                }
                used.append(questionIndex)
                let nextQuestion = questions[questionIndex]
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
