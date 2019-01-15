//
//  GameScene.swift
//  CannonWars
//
//  Created by Daval Cato on 1/14/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var cannon:SKSpriteNode!
    var touchLocation:CGPoint = CGPoint.zero

    
    override func didMove(to view: SKView) {
        cannon = self.childNode(withName: "cannon") as? SKSpriteNode
        
       
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchLocation = touches.first!.location(in: self)
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchLocation = touches.first!.location(in: self)
    
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let ball:SKSpriteNode = SKScene(fileNamed: "Ball")!.childNode(withName: "ball") as! SKSpriteNode
        ball.removeFromParent()
        self.addChild(ball)
        ball.zPosition = 0
        ball.position = cannon.position
        let angleInRadians = Float(cannon.zRotation)
        let speeed = CGFloat(75.0)
        let vx:CGFloat = CGFloat(cosf(angleInRadians)) * speed
        let vy:CGFloat = CGFloat(sinf(angleInRadians)) * speed
        ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 250))
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        let percent = touchLocation.x / size.width
        let newAngle = percent * 180 - 180
        cannon.zRotation = CGFloat(newAngle) * CGFloat(Double.pi) / 180.0
    }
}
