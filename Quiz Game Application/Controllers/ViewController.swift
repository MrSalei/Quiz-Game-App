//
//  ViewController.swift
//  Quiz Game Application
//
//  Created by luqrri on 25.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func rulesButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Rules", message: "You have to answer 10 questions. If you fail twice, you are knocked out.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got it", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    @IBAction func exitButtonPressed(_ sender: Any) {
        exit(0)
    }
    @IBAction func startGame() {
        let vc = storyboard?.instantiateViewController(identifier: "game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)        
    }
        
    private let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    func refresh() {
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
}
