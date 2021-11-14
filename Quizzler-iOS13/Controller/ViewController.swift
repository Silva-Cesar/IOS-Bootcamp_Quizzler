//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1button: UIButton!
    @IBOutlet weak var choice2button: UIButton!
    @IBOutlet weak var choice3button: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRigt = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRigt {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval:0.2, target:self, selector:#selector(updateUI), userInfo:nil, repeats:false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1button.setTitle("\(quizBrain.getChoiceText(choice: 0))", for: .normal)
        choice1button.backgroundColor = UIColor.clear
        
        choice2button.setTitle("\(quizBrain.getChoiceText(choice: 1))", for: .normal)
        choice2button.backgroundColor = UIColor.clear
        
        choice3button.setTitle("\(quizBrain.getChoiceText(choice: 2))", for: .normal)
        choice3button.backgroundColor = UIColor.clear
    }
}

