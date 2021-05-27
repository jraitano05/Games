//
//  ViewController.swift
//  Games
//
//  Created by period4 on 4/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var turnLabel: UILabel!
    var allLabels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allLabels = [labelOne, labelTwo, labelThree, labelFour, labelFive, labelSix, labelSeven, labelEight, labelNine]
    }
        
        // Do any additional setup after loading the view.
        
        func placeInToLabel(myLabel: UILabel) {
            if myLabel.text == "" {
                if  turnLabel.text == "X" {
                myLabel.text = turnLabel.text
                turnLabel.text = "O"
                }
            else {
                myLabel.text = turnLabel.text
            turnLabel.text = "O"
                myLabel.text = turnLabel.text
                turnLabel.text = "X"
            }
            }
        }
        
        @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
                let selectedPoint = sender.location(in: myView)
                for label in allLabels {
                    if label.frame.contains(selectedPoint) {
                    placeInToLabel(myLabel: label)
                }
                }
            }
        
        func checkForWinner() {
    
            if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text  && labelOne.text != "" {
            
            }
            if labelFour.text == labelFive.text && labelFive.text == labelSix.text  && labelFour.text != "" {
            
            }
            if labelSeven.text == labelEight.text && labelEight.text == labelNine.text  && labelSeven.text != "" {
            
            }
            if labelOne.text == labelFour.text && labelFour.text == labelSeven.text  && labelOne.text != "" {
            
            }
            if labelTwo.text == labelFive.text && labelFive.text == labelEight.text  && labelTwo.text != "" {
            
            }
            if labelThree.text == labelSix.text && labelSix.text == labelNine.text  && labelThree.text != "" {
            
            }
            if labelOne.text == labelFive.text && labelFive.text == labelNine.text  && labelOne.text != "" {
            
            }
            if labelThree.text == labelFive.text && labelFive.text == labelSeven.text  && labelThree.text != "" {
            
            }
        }

                func alert() {
                    let winningAlert = UIAlertController(title: "YOU WIN!", message:  "Have a cookie.", preferredStyle: .alert)
                    let newGameButton = UIAlertAction(title: "New Game", style: .default) { (action) in self.reset()
                                                      }
                    winningAlert.addAction(newGameButton)
                    present(winningAlert, animated: true, completion: nil)
                
                }

        

            func reset() {
                for label in allLabels {
                    label.text = ""
                }

            }


}
