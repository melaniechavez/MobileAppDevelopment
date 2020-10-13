//
//  ViewController.swift
//  project1
//
//  Created by Melanie Chavez on 10/2/20.
//  Copyright © 2020 Melanie Chavez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let questions = ["What is your favorite season?", "What is your favorite food?", "How do you commute to work?", "What is your favorite music genre?", "What is your favorite color?"]
    let answers = [["Summer", "Spring", "Fall", "Winter"], ["Bus", "Drive", "Subway", "Bike"], ["Seafood", "BBQ", "Pizza", "Burgers"], ["Alternative Rock", "Indie", "Pop", "EDM"], ["Blue", "Yellow", "Black", "Green"]]
    
    var currentQ = 0
    var count = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBAction func choose(_ sender: UIButton) {
        //gives each question a weight so that they can be used for results later
        if(sender.tag == 1){
            count += 1
        } else if(sender.tag == 2){
            count += 2
        } else if(sender.tag == 3){
            count += 3
        } else if(sender.tag == 4){
            count += 4
        }
        
        //if the current Questions != to the end (of the questions) call the next one
        if(currentQ != questions.count){
            nextQuestion()
        } else if(currentQ == questions.count){ //if the current Question is equal to the end end the quiz & show results
            endQuiz()
        }
    }
    
    func nextQuestion(){
        //changes the question label by using the questions array
        questionLabel.text = questions[currentQ]
        
        //creates a new button of type UIButton():
        var button:UIButton = UIButton()
        //counter variable:
        var c = 0
        
        //loop through the choices
        for i in 1...4{
            //sets the new button to be the view of the button with the same tag
            //with help from: https://stackoverflow.com/questions/28473893/referencing-a-uibutton-by-tag-value/43323037
            //& https://developer.apple.com/documentation/uikit/uibutton/1624018-settitle
            button = view.viewWithTag(i) as! UIButton
            button.setTitle(answers[currentQ][c], for: .normal)
            //update the count:
            c += 1
        }
        currentQ += 1
    }
    
    func endQuiz(){
        //Hide the choice buttons
        //Got the isHidden property from: https://stackoverflow.com/questions/43385461/hide-button-xcode/43385588
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        
        //update label:
        questionLabel.text = "You belong in ..."
        
        //connect count with their respective cities:
        if(count <= 6){
            result.text = "Seattle!"
        } else if(6 < count && count <= 10){
            result.text = "Austin!"
        } else if(10 < count && count <= 15){
            result.text = "New York City!"
        } else if(15 < count && count <= 20){
            result.text = "Denver!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextQuestion()
    }


}

