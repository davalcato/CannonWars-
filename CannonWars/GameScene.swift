//
//  GameScene.swift
//  CannonWars
//
//  Created by Daval Cato on 1/14/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import SpriteKit
import GameplayKit

let wallMask:UInt32 = 0x1 << 0 // 1
let ballMask:UInt32 = 0x1 << 1 // 2
let pegMask:UInt32 = 0x1 << 2 // 4
let squareMask:UInt32 = 0x1 << 3 // 8



class GameScene: SKScene, SKPhysicsContactDelegate {
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
        _ = CGFloat(75.0)
        let _:CGFloat = CGFloat(cosf(angleInRadians)) * speed
        let _:CGFloat = CGFloat(sinf(angleInRadians)) * speed
        ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 75))
        ball.physicsBody?.collisionBitMask = wallMask | ballMask | pegMask 
        
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        let percent = touchLocation.x / size.width
        let newAngle = percent * 180 - 180
        cannon.zRotation = CGFloat(newAngle) * CGFloat(Double.pi) / 180.0
    }
}
