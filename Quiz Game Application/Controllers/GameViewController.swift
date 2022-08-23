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
    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func backButtonPressed(_ sender: Any) {
        //let vc = self.storyboard?.instantiateViewController(identifier: "menu") as! ViewController
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var backButton: UIButton!
    
    private var questions: [Question] = [], currentQuestion: Question?, questionIndex = 0, failures = 0, attempts = 1, used: [Int] = [], timer: Timer?, timeLeft = 60

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        table.delegate = self
        table.dataSource = self
        setupQuestions(with: Question.questions)
        questionIndex = Randomizer.getRandomCount(questions: questions)
        used.append(questionIndex)
        configureUI(question: questions[questionIndex])
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        backButton.contentHorizontalAlignment = .left
    }
    
    private func setupQuestions(with questions: [Question]) {
        self.questions = questions
    }
    
    private func configureUI(question: Question) {
        label.text = question.text
        currentQuestion = question
        table.reloadData()
    }
    
    @objc private func onTimerFires() {
        timeLeft -= 1
        timeLabel.text = "\(timeLeft)"
        if timeLeft <= 0 {
            stopTimer()
            timeOut()
        }
        else if timeLeft <= 10 {
            timeLabel.shake()
        }
    }
    
    @objc private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool {
        question.answers.contains(where: { $0.text == answer.text }) && answer.correct
    }
    
    //TABLE VIEW FUNCTIONS
    
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
                twoFailures()
            }
            else {
                oneFailure()
            }
        }
    }
    
    private func createAlert(title: String, message: String) -> UIAlertController {
        UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    private func addActionBackToMenu(alert: UIAlertController) {
        alert.addAction(UIAlertAction(title: "Back to menu", style: .default, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
    }
    
    private func addActionTryAgain(alert: UIAlertController) {
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { _ in
            self.failures = 0
            self.used = []
            self.table.delegate = self
            self.table.dataSource = self
            self.questionIndex = Randomizer.getRandomCount(questions: self.questions)
            self.used.append(self.questionIndex)
            self.configureUI(question: self.questions[self.questionIndex])
            self.progressSlider.value = 0
            self.attempts += 1
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.onTimerFires), userInfo: nil, repeats: true)
            self.timeLeft = 60
            self.timeLabel.text = String(self.timeLeft)
        }))
    }
    
    private func addActionPlayAgain(alert: UIAlertController) {
        alert.addAction(UIAlertAction(title: "Play again", style: .default, handler: { _ in
            self.failures = 0
            self.used = []
            self.table.delegate = self
            self.table.dataSource = self
            self.questionIndex = Randomizer.getRandomCount(questions: self.questions)
            self.used.append(self.questionIndex)
            self.configureUI(question: self.questions[self.questionIndex])
            self.progressSlider.value = 0
            self.attempts = 1
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.onTimerFires), userInfo: nil, repeats: true)
            self.timeLeft = 60
            self.timeLabel.text = String(self.timeLeft)
        }))
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
    
    private func oneFailure() {
        let alert = createAlert(title: "Wrong answer", message: "This was your first mistake.")
        alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
        addActionBackToMenu(alert: alert)
        present(alert, animated: true)
        nextQuestion()
    }
    
    private func twoFailures() {
        let alert = createAlert(title: "Wrong answer", message: "This was your second mistake. You did not pass.")
        addActionTryAgain(alert: alert)
        addActionBackToMenu(alert: alert)
        present(alert, animated: true)
        stopTimer()
    }
    
    private func success() {
        stopTimer()
        let alert = createAlert(title: "Congratulations!", message: "You passed the test on the \(attempts) try.")
        addActionPlayAgain(alert: alert)
        addActionBackToMenu(alert: alert)
        present(alert, animated: true)
    }
    
    private func timeOut() {
        let alert = createAlert(title: "Time out", message: "You did not pass in 60 seconds.")
        addActionTryAgain(alert: alert)
        addActionBackToMenu(alert: alert)
        present(alert, animated: true)
    }
}

public enum ZHYShakeDirection: Int {
    case horizontal
    case vertical
}
 
extension UIView {
    public func shake(direction: ZHYShakeDirection = .horizontal, times: Int = 5, interval: TimeInterval = 0.1, offset: CGFloat = 2, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: interval, animations: {
            switch direction {
                case .horizontal:
                    self.layer.setAffineTransform(CGAffineTransform(translationX: offset, y: 0))
                case .vertical:
                    self.layer.setAffineTransform(CGAffineTransform(translationX: 0, y: offset))
            }
            
        }) { (complete) in
            if (times == 0) {
                UIView.animate(withDuration: interval, animations: {
                    self.layer.setAffineTransform(CGAffineTransform.identity)
                }, completion: { (complete) in
                    completion?()
                })
            }
            else {
                self.shake(direction: direction, times: times - 1, interval: interval, offset: -offset, completion: completion)
            }
        }
    }
}
