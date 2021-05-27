//
//  Breakout.swift
//  Games
//
//  Created by period4 on 4/27/21.
//

import UIKit
import AVFoundation

class Breakout: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var ball: UIView!
    @IBOutlet weak var paddle: UIView!
    
    @IBOutlet weak var birckOne: UIView!
    @IBOutlet weak var brickTwo: UIView!
    @IBOutlet weak var brickThree: UIView!
    @IBOutlet weak var brickFour: UIView!
    @IBOutlet weak var brickFive: UIView!
    @IBOutlet weak var brickSix: UIView!
    @IBOutlet weak var brickSeven: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    var allBricks = [UIView]()
    var dynamicAnimator : UIDynamicAnimator!
    var pushBehavior : UIPushBehavior!
    var collisionBehavior : UICollisionBehavior!
    var ballDynamicBehavior : UIDynamicItemBehavior!
    var paddleDynamicBehavior : UIDynamicItemBehavior!
    var bricksDynamicBehavior : UIDynamicItemBehavior!
    var startingPoint: CGPoint = CGPoint(x: 100, y: 200)
    
    var brickCount = 7
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.layer.cornerRadius = 12
        allBricks = [birckOne, brickTwo, brickThree, brickFour, brickFive, brickSix, brickSeven]
        ball.isHidden = true
        paddle.isHidden = true
        
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        paddle.center = CGPoint(x: sender.location(in: view).x, y: paddle.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddle)
    }
    
    func dynamicBehaviors() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 0.7, dy: 0.7)
        pushBehavior.active = true
        pushBehavior.magnitude = 0.2
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [ball, paddle] + allBricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        collisionBehavior.collisionDelegate = self
       
        ballDynamicBehavior = UIDynamicItemBehavior(items: [ball])
        ballDynamicBehavior.allowsRotation = true
        ballDynamicBehavior.elasticity = 1
        ballDynamicBehavior.friction = 0.0
        ballDynamicBehavior.resistance = 0.0
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddle])
        paddleDynamicBehavior.density = 1000
        paddleDynamicBehavior.elasticity = 0.5
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
        bricksDynamicBehavior = UIDynamicItemBehavior(items: allBricks)
        bricksDynamicBehavior.density = 700
        bricksDynamicBehavior.elasticity = 1
        bricksDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(bricksDynamicBehavior)
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehaviors()
        sender.isHidden = true
        ball.isHidden = false
        paddle.isHidden = false
        print("test")
        let sound = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "HAVE FUN Broeski!")
        sound.speak(utterance)
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for brick in allBricks{
            if item1.isEqual(ball) && item2.isEqual(brick) {
                brick.isHidden = true
                collisionBehavior.removeItem(brick)
                brickCount = brickCount - 1
                print(brickCount)
                if brickCount == 0 {
                    winAlert()
                    //ball.isHidden = true
                    //collisionBehavior.removeItem(ball)
                    ballDynamicBehavior.resistance = 1000
                    startButton.isHidden = false
                    brickCount = 7
                    for bricks in allBricks{
                        bricks.isHidden = false
                    }
                }
                
            }
        }
        
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if p.y > paddle.center.y + 20{
            alert()
        }
    }
    func reset() {

    }
        
    func alert() {
            
            let losingAlert = UIAlertController(title: "Game Over", message:  "Try Again", preferredStyle: .alert)
            let newGameButton = UIAlertAction(title: "New Game", style: .default) { (action)
                in self.reset()
            }
            losingAlert.addAction(newGameButton)
            present(losingAlert, animated: true, completion: nil)
        }
    func winAlert() {
        let winAlert = UIAlertController(title: "YOU WON", message: "", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game?", style: .default) { (action)
            in self.reset()
        
        }
    }


}

