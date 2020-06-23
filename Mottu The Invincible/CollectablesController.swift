//
//  CollectablesController.swift
//  Mottu The Invincible
//
//  Created by Mahesh on 6/24/16.
//  Copyright © 2016 Mahesh. All rights reserved.
//

import SpriteKit

class CollectablesController {
    
    func getCollectables() -> SKSpriteNode {
        
        var collectable = SKSpriteNode()
        
        if Int(randomBetweennumbers(0, secondNum: 7)) >= 3 {
            
            if GameplayController.instance.life < 2 {
                
                collectable = SKSpriteNode(imageNamed: "Life")
                collectable.name = "Life"
                collectable.physicsBody = SKPhysicsBody(rectangleOfSize: collectable.size)
            }else {
                collectable.name = "Nothing"
            }
        }else {
            
            collectable = SKSpriteNode(imageNamed: "Coin")
            collectable.name = "Coin"
            collectable.physicsBody = SKPhysicsBody(circleOfRadius: collectable.size.height / 2)

        }
        
        collectable.physicsBody?.affectedByGravity = false
        collectable.physicsBody?.categoryBitMask = ColliderType.darkCloudAndCollectables
        collectable.physicsBody?.collisionBitMask = ColliderType.Player
        collectable.zPosition = 2
        
        return collectable
    }
    
    func randomBetweennumbers(firstNum: CGFloat, secondNum:CGFloat) -> CGFloat{
        
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum )
        
    }

}












































