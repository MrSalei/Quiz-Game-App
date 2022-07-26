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
    
    private var questions: [Question] = [], currentQuestion: Question?, questionIndex = 0, failures = 0, attempts = 1, used: [Int] = []

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
        progressSlider.value += 10
        
        if checkAnswer(answer: answer, question: question) {
            if progressSlider.value == 100 {
                success()
            }
            else {
                nextQuestion()
            }
        }
        else {
            failures += 1
            if progressSlider.value == 100 && failures == 1 {
                success()
            }
            else if failures == 2 {
                let alert = createAlert(title: "Wrong answer", message: "This was your second mistake. You did not pass.")
                addActionTryAgain(alert: alert)
                addActionBackToMenu(alert: alert)
                present(alert, animated: true)
            }
            else {
                let alert = createAlert(title: "Wrong answer", message: "This was your first mistake.")
                alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
                addActionBackToMenu(alert: alert)
                present(alert, animated: true)
                nextQuestion()
            }
        }
    }
    
    private func nextQuestion() {
        while true {
            questionIndex = Randomizer.getRandomCount(questions: questions)
            if !used.contains(questionIndex) {
                break
            }
        }
        used.append(questionIndex)
        currentQuestion = nil
        configureUI(question: questions[questionIndex])
    }
    
    private func createAlert(title: String, message: String) -> UIAlertController {
        UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    private func addActionBackToMenu(alert: UIAlertController) {
        alert.addAction(UIAlertAction(title: "Back to menu", style: .default, handler: {_ in
            let vc = self.storyboard?.instantiateViewController(identifier: "menu") as! ViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }))
    }
    
    private func addActionTryAgain(alert: UIAlertController) {
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: {_ in
            self.failures = 0
            self.used = []
            self.table.delegate = self
            self.table.dataSource = self
            self.questionIndex = Randomizer.getRandomCount(questions: self.questions)
            self.used.append(self.questionIndex)
            self.configureUI(question: self.questions[self.questionIndex])
            self.progressSlider.value = 0
            self.attempts += 1
        }))
    }
    
    private func success() {
        let alert = createAlert(title: "Congratulations!", message: "You passed the test on the \(attempts) try.")
        addActionBackToMenu(alert: alert)
        present(alert, animated: true)
    }
}
