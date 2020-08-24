//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    // Variables
    let quiz = [
          Question(q: "A slug's blood is green.", a: "True"),
          Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
          Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
          Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
          Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
          Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
          Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
          Question(q: "Google was originally called 'Backrub'.", a: "True"),
          Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
          Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
          Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
          Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle //True, False
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
            sender.setTitle("", for: .normal)
            sender.setImage(.checkmark, for: .normal)
        } else {
            sender.backgroundColor = UIColor.red
            sender.setTitleColor(.black, for: .normal)
            sender.setTitle("Wrong", for: .normal)
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        trueBtn.backgroundColor = UIColor.clear
        trueBtn.setImage(nil, for: .normal)
        trueBtn.setTitle("True", for: .normal)
        trueBtn.setTitleColor(.white, for: .normal)
        falseBtn.backgroundColor = UIColor.clear
        falseBtn.setImage(nil, for: .normal)
        falseBtn.setTitle("False", for: .normal)
        falseBtn.setTitleColor(.white, for: .normal)
        
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }

    
}

