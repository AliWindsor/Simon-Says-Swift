//
//  ViewController.swift
//  SimonSays
//
//  Created by Alicia Windsor on 30/10/2019.
//  Copyright © 2019 Alicia Windsor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//MARK: Properties

    @IBOutlet weak var levelNumber: UITextField!
    
    @IBOutlet weak var scoreText: UITextField!
    @IBOutlet weak var scoreNumber: UITextField!
    
    @IBOutlet weak var displayColour: UILabel!
    
    @IBOutlet var blueClick: UIButton!
    @IBOutlet var greenClick: UIButton!
    @IBOutlet var yellowClick: UIButton!
    @IBOutlet var redClick: UIButton!
    
//MARK: Main Variables
    var level = 0
    var score = 0
    
    var colours = [String]()
    var correctAnswer = 0
   
    override func viewDidLoad() {
        
        super.viewDidLoad()

        updateLevelNumber()
        updateScoreNumber()
        
        colours += ["Blue","Green","Yellow","Red"]
        
        askColour()
        
    }

//MARK: Functions
  
    func askColour() {
        
       // colours.shuffle()
        correctAnswer = Int.random(in: 0...3)
        displayColour.text = colours[correctAnswer]
    }
    
    func endGame(action: UIAlertAction! = nil){
        
    }
    
    func updateScoreNumber () {
        scoreNumber.text = String(score)
    }
    
    func updateLevelNumber () {
        levelNumber.text = String(level)
    }
         
//For some reason the buttons are not reading the current value, instead they are reading the next value and giving the score based off that. ie the colour displayed at the top is the answer for the PREVIOUS round not the current one. No idea how to fix this i am a huge idiot.
    
//how to get the buttons to read CURRENT colour not next number
    
//look at your original code in the playground since this doesn't seem to be working >.<
  
//nvm got the example code to work I guess, keep practicing maybe one day you'll be able to code simon says....

//MARK: Actions
    
    @IBAction func isbuttonTapped(_ sender: UIButton) {
        
        if score < 10 {
        
        if sender.tag == correctAnswer {
                levelNumber.text = "Correct"
                score += 1
            
           } else {
                levelNumber.text = "Wrong"
                score = 0
           }
        
            askColour()
            updateScoreNumber()
        } else {
            
        let fini = UIAlertController(title: title, message: "You got over \(score) points!", preferredStyle: .alert)
        fini.addAction(UIAlertAction(title: "Play Again", style: .default, handler: endGame))
        present(fini, animated: true)
            
            levelNumber.text = "-"
            score = 0
            updateScoreNumber()
        }
    }
    
}

