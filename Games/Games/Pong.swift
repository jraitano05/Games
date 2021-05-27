//
//  Pong.swift
//  Games
//
//  Created by period4 on 5/17/21.
//

import UIKit

class Pong: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var ball: UIView!
    @IBOutlet var paddle: UIView!
    @IBOutlet weak var paddle2: UIView!
    
    var dynamicAnimator : UIDynamicAnimator!
    var pushBehavior : UIPushBehavior!
    var collisionBehavior : UICollisionBehavior!
    var ballDynamicBehavior : UIDynamicItemBehavior!
    var paddleDynamicBehavior : UIDynamicItemBehavior!
    var paddle2DynamicBehavior : UIDynamicItemBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func dynamicBehaviors() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 0.7, dy: 0.7)
        pushBehavior.active = true
        pushBehavior.magnitude = 0.2
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [ball, paddle, paddle2])
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        
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
        
        paddle2DynamicBehavior = UIDynamicItemBehavior(items: [paddle2])
        paddle2DynamicBehavior.density = 1000
        paddle2DynamicBehavior.elasticity = 0.5
        paddle2DynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddle2DynamicBehavior)
        collisionBehavior.collisionDelegate = self

    }
    

    @IBAction func startButton(_ sender: Any) {
    dynamicBehaviors()
        ball.isHidden = false
        paddle.isHidden = false
        paddle2.isHidden = false
    }
    
    @IBAction func panGesture(_ sender: Any) {
        paddle.center = CGPoint(x: (sender as AnyObject).location(in: view).x, y: paddle.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddle)
    }
    
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if p.y > paddle.center.y + 20{
        
        }
    }
    
    
    
    
    
    
    
    
}
